# Nixpkgs Package Cleanup Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Remove local package definitions and updater entries for packages already provided by the flake's locked `inputs.nixpkgs`.

**Architecture:** Package export is driven by `packages/default.nix`, which auto-scans package directories containing `pkg.nix`. Deleting an approved package directory removes the local overlay attribute and allows references like `pkgs.novnc` to resolve to the locked nixpkgs package instead.

**Tech Stack:** Nix flakes, `packages/default.nix` directory scanning, Bash updater scripts, `nix eval` verification.

## Global Constraints

- Use the current `flake.lock` `inputs.nixpkgs` as the source of truth.
- Delete only the approved package directories: `cockpit-machines`, `dnslookup`, `fcitx5-material-color`, `libvirt-dbus`, `mainsail`, `microsocks`, `novnc`, `speedtest`, `trojan-go`, `tun2socks`.
- Keep `packages/leaf` because locked nixpkgs exposes `pkgs.leaf` only as a removed-package alias that fails evaluation.
- Keep `commit-notifier`, `reader`, `realm`, and `ksmbd-tools`.
- Remove matching updater entries from `update.bash`; do not change `update_daily.bash` for this cleanup.

---

## File Structure

- Delete package directories under `packages/` for the approved package set. These directories are the only source of the local package exports because `packages/default.nix` auto-scans directories containing `pkg.nix`.
- Modify `update.bash` to remove updater commands for deleted packages.
- Do not modify `packages/default.nix`; its scanner will naturally stop exporting deleted directories.
- Do not modify local modules. Module references should resolve through nixpkgs after local overlay attrs disappear.

### Task 1: Remove Local Package Definitions

**Files:**
- Delete: `packages/cockpit-machines/`
- Delete: `packages/dnslookup/`
- Delete: `packages/fcitx5-material-color/`
- Delete: `packages/libvirt-dbus/`
- Delete: `packages/mainsail/`
- Delete: `packages/microsocks/`
- Delete: `packages/novnc/`
- Delete: `packages/speedtest/`
- Delete: `packages/trojan-go/`
- Delete: `packages/tun2socks/`

**Interfaces:**
- Consumes: `packages/default.nix` scans package directories with `pkg.nix`.
- Produces: Removed local overlay attrs for the approved package names, allowing nixpkgs attrs to be used.

- [ ] **Step 1: Confirm approved package dirs exist**

Run: `for name in cockpit-machines dnslookup fcitx5-material-color libvirt-dbus mainsail microsocks novnc speedtest trojan-go tun2socks; do test -d "packages/$name" || exit 1; done`

Expected: command exits with status 0.

- [ ] **Step 2: Delete approved package dirs**

Delete exactly the directories listed in this task. Do not delete `packages/leaf`.

- [ ] **Step 3: Confirm deleted dirs are gone**

Run: `for name in cockpit-machines dnslookup fcitx5-material-color libvirt-dbus mainsail microsocks novnc speedtest trojan-go tun2socks; do test ! -e "packages/$name" || exit 1; done`

Expected: command exits with status 0.

### Task 2: Remove Updater Entries

**Files:**
- Modify: `update.bash`
- Leave unchanged: `update_daily.bash`

**Interfaces:**
- Consumes: package deletion set from Task 1.
- Produces: `update.bash` no longer tries to update deleted local package attrs.

- [ ] **Step 1: Remove update lines**

Remove these exact lines from `update.bash`:

```bash
nix-update --commit --flake trojan-go
nix-update --commit --flake fcitx5-material-color
nix-update --commit --flake microsocks
nix-update --commit --flake tun2socks
nix-update --commit --flake novnc
nix-update --commit --flake cockpit-machines
nix-update --commit --flake libvirt-dbus
nix-update --commit --flake mainsail
```

- [ ] **Step 2: Confirm updater entries are absent**

Run: `rg 'nix-update --commit --flake (trojan-go|fcitx5-material-color|microsocks|tun2socks|novnc|cockpit-machines|libvirt-dbus|mainsail)' update.bash`

Expected: command exits non-zero with no matches.

- [ ] **Step 3: Confirm intentionally kept updater entries remain**

Run: `rg 'nix-update --commit --flake (realm|reader|vpncloud|hev-socks5-tproxy)' update.bash`

Expected: command prints matching lines for kept packages.

### Task 3: Verify Flake Resolution

**Files:**
- Read-only verification: `flake.nix`, `packages/default.nix`, `update.bash`, `update_daily.bash`

**Interfaces:**
- Consumes: cleaned package directories and updater script.
- Produces: evidence that local exports evaluate and selected names resolve through nixpkgs.

- [ ] **Step 1: Verify local package set evaluates**

Run: `nix eval --json .#packages.$(nix eval --raw --impure --expr builtins.currentSystem).packageList`

Expected: command exits with status 0 and returns a Nix store path JSON string for `packages.json`.

- [ ] **Step 2: Verify deleted names are no longer local package dirs**

Run: `for name in cockpit-machines dnslookup fcitx5-material-color libvirt-dbus mainsail microsocks novnc speedtest trojan-go tun2socks; do test ! -d "packages/$name" || exit 1; done`

Expected: command exits with status 0.

- [ ] **Step 3: Verify nixpkgs provides usable replacements**

Run: `nix eval --json --impure --expr 'let flake = builtins.getFlake (toString /home/indexyz/Projects/nixos); pkgs = import flake.inputs.nixpkgs { system = builtins.currentSystem; }; names = [ "cockpit-machines" "dnslookup" "fcitx5-material-color" "libvirt-dbus" "mainsail" "microsocks" "novnc" "speedtest" "trojan-go" "tun2socks" ]; in map (name: pkgs.${name}.pname or name) names'`

Expected: command exits with status 0 and returns one entry for each deleted package.

- [ ] **Step 4: Verify `leaf` remains local**

Run: `test -f packages/leaf/pkg.nix && nix eval --raw .#packages.$(nix eval --raw --impure --expr builtins.currentSystem).leaf.pname`

Expected: command prints `leaf`.
