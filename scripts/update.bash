#!/usr/bin/env bash

set -x

# A single package must not freeze the whole pipeline.
#
# This script used to run under `set -e`, so the first failing nix-update
# aborted it and the workflow's `git push` never ran: an unbuildable
# ping-exporter update blocked mumble-discord-bridge, mattermost-ent,
# sing-box-extended and teleport-ent for days. Every update now runs in
# isolation - the ones that succeed are committed as before, the ones that
# fail are recorded and reported in the job summary.

failed=()
succeeded=()

fail() {
  failed+=("$1: $2")
  echo "::warning::update failed for $1 ($2)"
}

ok() {
  succeeded+=("$1")
}

# Run nix-update for one package. Extra arguments are passed through, so a
# caller can add e.g. `--version 1.2.3`.
update_pkg() {
  local package="$1"
  shift
  local status=0
  echo "::group::updating $package"
  nix-update --commit "$@" --flake "$package" || status=$?
  if [ "$status" -eq 0 ]; then
    ok "$package"
  else
    fail "$package" "nix-update exited with $status (no commit created)"
  fi
  echo "::endgroup::"
}

# Update a package whose version lives in a file the repo generates itself.
update_local_pkg() {
  local package="$1"
  local current_version new_version
  echo "::group::updating $package"

  if ! current_version=$(nix eval --raw ".#packages.x86_64-linux.$package.version"); then
    fail "$package" "could not evaluate the current version"
    echo "::endgroup::"
    return
  fi

  # teleport-ent's update.sh writes version.nix into the current directory,
  # so it has to run from inside the package directory.
  if ! (cd "packages/$package" && bash update.sh); then
    fail "$package" "packages/$package/update.sh failed"
    echo "::endgroup::"
    return
  fi

  # Stage only this package: an earlier failed update can leave unrelated
  # files modified in the working tree.
  git add -- "packages/$package"

  if ! new_version=$(nix eval --raw ".#packages.x86_64-linux.$package.version"); then
    fail "$package" "could not evaluate the version after running update.sh"
    echo "::endgroup::"
    return
  fi

  if [ "$current_version" = "$new_version" ]; then
    ok "$package (already up to date)"
    echo "::endgroup::"
    return
  fi

  if git commit -m "$package: $current_version -> $new_version" -- "packages/$package"; then
    ok "$package"
  else
    fail "$package" "could not commit $current_version -> $new_version"
  fi
  echo "::endgroup::"
}

report() {
  local summary
  summary=$(
    echo "## Package updates"
    echo
    echo "| Result | Count | Packages |"
    echo "| --- | --- | --- |"
    echo "| OK | ${#succeeded[@]} | ${succeeded[*]:-none} |"
    echo "| Failed | ${#failed[@]} | ${failed[*]:-none} |"
  )
  echo "$summary" >&2
  if [ -n "${GITHUB_STEP_SUMMARY:-}" ]; then
    echo "$summary" >> "$GITHUB_STEP_SUMMARY"
  fi
}

update_pkg rustdesk-server-pro
update_pkg realm
update_pkg vpncloud
update_pkg hev-socks5-tproxy
update_pkg landrop --url https://github.com/LANDrop/LANDrop
update_pkg candy

update_pkg yacd
update_pkg cloudreve
update_pkg ping-exporter
update_pkg mumble-discord-bridge

mattermost_version=$(curl 'https://deb.packages.mattermost.com/dists/noble/main/binary-amd64/Packages' | grep -E '^Package: mattermost$' -A10 | grep -E '^Version: (.*)$' | awk -F ':' '{print $2}' | awk -F '-' '{print $1}'| awk '{$1=$1;print}' | sort -V | tail -n 1)
if [ -z "$mattermost_version" ]; then
  fail mattermost-ent "could not read the version from the mattermost apt repository"
else
  update_pkg mattermost-ent --version "$mattermost_version"
fi

for package in "sing-box-extended" "teleport-ent"; do
  update_local_pkg "$package"
done

report

# Exit 0 even when a package failed: the successful commits are already on the
# branch and `git push` in the workflow still has to run. Failures are visible
# as warnings plus the job summary instead of freezing every other package.
exit 0
