#!/usr/bin/env nix-shell
#!nix-shell -i bash -p coreutils curl jq common-updater-scripts
set -euo pipefail

tag_name=$(curl https://api.github.com/repos/gravitational/teleport/releases/latest | jq -r ".tag_name")
prefix="v"

version=${tag_name#"$prefix"}

amd64_pkg_hash=$(nix-prefetch-url "https://cdn.teleport.dev/teleport-ent-v$version-linux-amd64-bin.tar.gz")
amd64_pkg_hash=$(nix hash to-sri "sha256:$amd64_pkg_hash")

arm64_pkg_hash=$(nix-prefetch-url "https://cdn.teleport.dev/teleport-ent-v$version-linux-arm64-bin.tar.gz")
arm64_pkg_hash=$(nix hash to-sri "sha256:$arm64_pkg_hash")

cat > version.nix <<EOF
{
  version = "$version";
  hash = {
    x86_64-linux = "$amd64_pkg_hash";
    aarch64-linux = "$arm64_pkg_hash";
  };
}
EOF
