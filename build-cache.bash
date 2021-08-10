#!/usr/bin/env bash
set -ex

# Work-around the issue with glibc 2.33 on old Docker engines
# Extract files directly as pacman is also affected by the issue
patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst
curl -LO https://repo.archlinuxcn.org/x86_64/$patched_glibc
bsdtar -C / -xvf $patched_glibc

pacman -Syu --noconfirm
pacman -S nix --noconfirm

nix-channel --add https://nixos.org/channels/nixos-unstable nixos
nix-channel --update
nix-env -iA nixos.nixUnstable

# Nix flags
mkdir -p /etc/nix
cat > /etc/nix/nix.conf <<EOF
experimental-features = nix-command flakes
substituters = https://indexyz.cachix.org https://cache.nixos.org/
trusted-public-keys = indexyz.cachix.org-1:biBEnuZ4vTSsVMr8anZls+Lukq8w4zTHAK8/p+fdaJQ= cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=
sandbox = true
trusted-users = root
allowed-users = *
EOF

nix --version

nix-env -i nixpkgs-fmt bash jq tmate which git
mkdir -p /usr/drone/bin/
ln -s $(which tmate) /usr/drone/bin/tmate
nixpkgs-fmt --check .
nix-env -iA cachix -f https://cachix.org/api/v1/install
cachix authtoken $CACHIX_TOKEN


nix build '.#onedev'

# Upload and build cache

# PACKAGES_LIST=$(nix-build list-package.nix)
# for PACKAGE in $(cat $PACKAGES_LIST | jq -r '.[]'); do
#   echo "Build package: $PACKAGE"
#   nix build --no-link ".#"$PACKAGE
#   if [ $? -eq 0 ]; then
#     echo "Build Package Successfully"s
#     PACKAGE_LOCATION=$(nix eval --raw ".#"$PACKAGE)
#     echo "Package location: $PACKAGE_LOCATION"
#     cachix push indexyz $PACKAGE_LOCATION
#     PACKAGE_DRV_LOCATION=$(nix eval --raw ".#"$PACKAGE".drvPath")
#     echo "Package drv location: $PACKAGE_DRV_LOCATION"
#     cachix push indexyz $PACKAGE_DRV_LOCATION
#   else
#     echo "::warning::Error occurred during building package "$PACKAGE
#   fi
# done
