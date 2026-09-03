#!/usr/bin/env nix-shell
#!nix-shell -i bash -p curl jq nix-update
# shellcheck shell=bash
set -euo pipefail

package="sing-box-extended"
repository="shtorm-7/sing-box-extended"
repo_root=$(git rev-parse --show-toplevel)

cd "$repo_root"

tag_name=$(
  curl --fail --silent --show-error --location \
    "https://api.github.com/repos/$repository/releases/latest" \
    | jq --exit-status --raw-output '.tag_name'
)
version=${tag_name#v}

if [[ "$version" != *-extended-* ]]; then
  echo "Unexpected release tag: $tag_name" >&2
  exit 1
fi

current_version=$(nix eval --raw ".#$package.version")
if [[ "$current_version" == "$version" ]]; then
  echo "$package is up to date: $version"
  exit 0
fi

# Update the source first. The admin panel and Go module hashes depend on it.
nix-update --version "$version" --src-only --flake "$package"

# Update the nested npm dependency hash, then the parent Go vendor hash.
nix-update --version skip --no-src --subpackage adminPanel --flake "$package"
