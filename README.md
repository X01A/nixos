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

## Module Discovery

NixOS modules are exported through `modules/all-modules.nix`. The aggregator discovers module entrypoints under these top-level directories: `environment`, `services`, `devices`, `desktop`, `system`, and `network`.

A module entrypoint is either a direct `.nix` file under one of those directories or a direct child directory with a `default.nix`. Nested files inside an entrypoint directory are treated as internals owned by that parent module and are not imported directly by `all-modules.nix`.

`modules/services/secrets` follows the entrypoint convention but is explicitly excluded from `all-modules.nix` because it requires deployment module options that are not available during plain NixOS evaluation.

Home Manager program modules follow the same entrypoint rule under `home/programs`.

