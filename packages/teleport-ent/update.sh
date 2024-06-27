#!/usr/bin/env nix-shell
#!nix-shell -i bash -p coreutils curl jq common-updater-scripts
set -euo pipefail

version=$(curl --fail -s https://goteleport.com/download/ | grep -oP 'bash -s \K([\d]{1,}\.[\d]{1,}.[\d]{1,})')

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
