# NixOS

[![Test](https://github.com/X01A/nixos/actions/workflows/test.yaml/badge.svg)](https://github.com/X01A/nixos/actions/workflows/test.yaml)
[![Cache Build Status](https://cloud.drone.io/api/badges/X01A/nixos/status.svg)](https://cloud.drone.io/X01A/nixos)

Personal nixos configuation

## Setup

Setup binary cache to speed up build

```nix
nix = {
  binaryCaches = [
    "https://indexyz.cachix.org"
  ];
  binaryCachePublicKeys = [
    "indexyz.cachix.org-1:biBEnuZ4vTSsVMr8anZls+Lukq8w4zTHAK8/p+fdaJQ="
  ];
};
```
