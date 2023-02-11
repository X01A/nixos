# NixOS

[![Build cache](https://github.com/X01A/nixos/actions/workflows/build.yaml/badge.svg)](https://github.com/X01A/nixos/actions/workflows/build.yaml)

Personal nixos module and pkgs

## Setup

Setup binary cache to speed up build

```nix
nix.settings = {
  substituters = [
    "https://attic.indexyz.me/indexyz"
    "https://indexyz.cachix.org"

  ];
  trusted-public-keys = [
    "indexyz:XxexOMK+bHXR2slT4A9wnJg00EZFXCUYqlUhlEEGQEc="
    "indexyz.cachix.org-1:biBEnuZ4vTSsVMr8anZls+Lukq8w4zTHAK8/p+fdaJQ="
  ];
};
```

