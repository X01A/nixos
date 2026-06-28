# Nixpkgs Package Cleanup Design

## Goal

Remove local package definitions that are already provided by the flake's locked `inputs.nixpkgs`, and remove their matching automatic update entries.

The cleanup uses the current `flake.lock` input as the source of truth, not upstream `NixOS/nixpkgs` branches.

## Package Selection

Delete local package directories when all of these are true:

- The local package is exported by `flake.packages.${system}` through `packages/default.nix`.
- The same attribute exists in the locked `inputs.nixpkgs` package set.
- The nixpkgs attribute evaluates to a usable derivation.

Delete these local package directories:

- `packages/cockpit-machines`
- `packages/dnslookup`
- `packages/fcitx5-material-color`
- `packages/libvirt-dbus`
- `packages/mainsail`
- `packages/microsocks`
- `packages/novnc`
- `packages/speedtest`
- `packages/trojan-go`
- `packages/tun2socks`

Keep `packages/leaf` because locked nixpkgs exposes `pkgs.leaf` only as a removed-package alias that fails evaluation. It is not a usable replacement for the local package or `modules/services/leaf.nix`.

Keep internal or non-target collisions such as `commit-notifier`, `reader`, `realm`, and `ksmbd-tools` because they are local variants or os-specific helpers outside the approved deletion set.

## Updater Cleanup

Remove `nix-update --commit --flake ...` lines from `update.bash` for deleted packages when such lines exist:

- `trojan-go`
- `fcitx5-material-color`
- `microsocks`
- `tun2socks`
- `novnc`
- `cockpit-machines`
- `libvirt-dbus`
- `mainsail`

No updater entries were found for `dnslookup` or `speedtest`.

No changes are needed in `update_daily.bash` for the approved deletion set.

## Module Behavior

Do not rewrite local modules that reference names now supplied by nixpkgs. After removing the local package directories, references such as `pkgs.novnc` and `pkgs.fcitx5-material-color` should resolve to the locked nixpkgs package through the overlay package set.

Do not change `modules/services/leaf.nix`, because `leaf` is intentionally kept local.

## Verification

After deletion, verify that:

- Removed package names no longer appear as local package directories.
- Removed package names are absent from updater scripts.
- The flake package set evaluates for the current system.
- Relevant package/module references still resolve through nixpkgs where applicable.
