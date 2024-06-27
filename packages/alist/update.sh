#!/usr/bin/env nix-shell
#!nix-shell -i bash -p coreutils curl jq common-updater-scripts
set -euo pipefail

version=$(curl -s --show-error "https://api.github.com/repos/alist-org/alist/releases/latest" | jq -r '.tag_name' | tail -c +2)

amd64_pkg_hash=$(nix-prefetch-url https://github.com/alist-org/alist/releases/download/v${version}/alist-linux-musl-amd64.tar.gz)
amd64_pkg_hash=$(nix hash to-sri "sha256:$amd64_pkg_hash")

arm64_pkg_hash=$(nix-prefetch-url https://github.com/alist-org/alist/releases/download/v${version}/alist-linux-musl-arm64.tar.gz)
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
