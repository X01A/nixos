#!/usr/bin/env bash
set -ex

nix --version

# Upload and build cache

PACKAGES_LIST=$(nix-build list-package.nix)
for PACKAGE in $(cat $PACKAGES_LIST | jq -r '.[]'); do
  echo "Build package: $PACKAGE"
  nix build --no-link ".#"$PACKAGE
  if [ $? -eq 0 ]; then
    echo "Build Package Successfully"s
    PACKAGE_LOCATION=$(nix eval --raw ".#"$PACKAGE)
    echo "Package location: $PACKAGE_LOCATION"
    cachix push indexyz $PACKAGE_LOCATION
    PACKAGE_DRV_LOCATION=$(nix eval --raw ".#"$PACKAGE".drvPath")
    echo "Package drv location: $PACKAGE_DRV_LOCATION"
    cachix push indexyz $PACKAGE_DRV_LOCATION
  else
    echo "::warning::Error occurred during building package "$PACKAGE
  fi
done
