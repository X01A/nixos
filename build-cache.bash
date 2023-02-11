#!/usr/bin/env bash
set -ex

nix --version

# Upload and build cache
PACKAGES_LIST=$(nix build --print-out-paths --no-link .#packageList)
for PACKAGE in $(jq -r '.[]' < "$PACKAGES_LIST"); do
  echo "Build package: $PACKAGE"
  if nix build --no-link ".#""$PACKAGE"; then
    echo "Build Package Successfully"s
    PACKAGE_LOCATION=$(nix eval --raw ".#""$PACKAGE")
    echo "Package location: $PACKAGE_LOCATION"
    cachix push indexyz "$PACKAGE_LOCATION"
    PACKAGE_DRV_LOCATION=$(nix eval --raw ".#""$PACKAGE"".drvPath")
    echo "Package drv location: $PACKAGE_DRV_LOCATION"
    cachix push indexyz "$PACKAGE_DRV_LOCATION"
  else
    echo "::warning::Error occurred during building package ""$PACKAGE"
  fi
done
