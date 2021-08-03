# NixOS

[![Test](https://github.com/X01A/nixos/actions/workflows/test.yaml/badge.svg)](https://github.com/X01A/nixos/actions/workflows/test.yaml)

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
