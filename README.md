# NixOS

[![Cache Build Status](https://img.shields.io/drone/build/X01A/nixos?label=Cache%20Build&server=https%3A%2F%2Fflame.indexyz.me)](https://flame.indexyz.me/X01A/nixos)

Personal nixos module and packaging

## Setup

Setup binary cache to speed up build

```nix
{
  nix = {
    binaryCaches = [
      "https://indexyz.cachix.org"
    ];
    binaryCachePublicKeys = [
      "indexyz.cachix.org-1:biBEnuZ4vTSsVMr8anZls+Lukq8w4zTHAK8/p+fdaJQ="
    ];
  };
}
```

