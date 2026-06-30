# Module Autodiscovery Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace manual module import lists with deterministic entrypoint discovery while preserving existing public option names.

**Architecture:** Extend the existing `lib/modules.nix` helper library with entrypoint discovery and path-derived option helpers. Use those helpers from the NixOS module aggregator and the Home Manager program aggregator, then document the entrypoint convention.

**Tech Stack:** Nix flakes, NixOS modules, Home Manager module syntax, existing repo formatter `nixpkgs-fmt`.

## Global Constraints

- Preserve existing public option names.
- Do not import Darwin, installer, helper-only, submodule-only, or parent-owned internal files into the main NixOS all-modules set.
- Importable entrypoints are direct `.nix` files under allowed directories or direct child directories with `default.nix`; do not recursively import every nested `.nix` file.
- Existing top-level modules previously omitted from the manual list, currently `network/wireguard.nix` and `services/secrets/default.nix`, must be explicitly classified by implementation.
- Generated import lists must be deterministic.
- Update durable documentation for the new module entrypoint convention.
- Rollback is restoring the previous manual import lists in `modules/all-modules.nix`, `home/all-modules.nix`, and `home/programs/default.nix`.

---

## File Structure

- Modify `lib/modules.nix`: add reusable entrypoint scanner functions and a path-derived option helper.
- Modify `modules/all-modules.nix`: replace manual imports with generated NixOS module entrypoints from allowed directories.
- Modify `home/programs/default.nix`: replace manual Home Manager program imports with generated entrypoints for that directory.
- Modify `README.md`: document module discovery rules for future module authors.
- Create no new runtime dependencies.

## Task 1: Add Scanner and Option Helper Library

**Files:**
- Modify: `lib/modules.nix`

**Interfaces:**
- Produces: `moduleEntrypoints :: path -> [ path ]`
- Produces: `moduleEntrypointsFromDirs :: path -> [ string ] -> [ path ]`
- Produces: `moduleOptionPath :: path -> path -> [ string ]`

- [ ] **Step 1: Run a failing eval for the new helper names**

Run:

```bash
nix eval --impure --extra-experimental-features 'nix-command flakes' --json --expr '
let
  flake = builtins.getFlake "path:/home/indexyz/Projects/nixos";
  lib = flake.inputs.nixpkgs.lib;
  moduleLib = import ./lib/modules.nix {
    inherit lib;
    self.attrs = import ./lib/attrs.nix { inherit lib; self = {}; };
  };
in builtins.attrNames { inherit (moduleLib) moduleEntrypoints moduleEntrypointsFromDirs moduleOptionPath; }
'
```

Expected: FAIL because `moduleEntrypoints`, `moduleEntrypointsFromDirs`, and `moduleOptionPath` are not defined yet.

- [ ] **Step 2: Add required imports in `lib/modules.nix`**

Change the `inherit (builtins)` block to include the new builtins:

```nix
  inherit (builtins)
    attrNames
    attrValues
    concatLists
    elem
    filter
    pathExists
    readDir
    stringLength
    substring
    ;
```

Change the `inherit (lib)` block to include list/string helpers:

```nix
  inherit (lib)
    filterAttrs
    hasPrefix
    hasSuffix
    id
    init
    last
    mapAttrsToList
    nameValuePair
    removeSuffix
    splitString
    ;
```

Keep the existing imported names that are still used by the old functions.

- [ ] **Step 3: Add the scanner and option helper functions**

Add these functions inside the existing `rec { ... }` in `lib/modules.nix`, after `mapModulesRec'`:

```nix
  moduleEntrypoints =
    dir:
    let
      entries = readDir dir;
      names = attrNames entries;
      helperEntrypointNames = [
        "utils.nix"
        "library.nix"
        "models.nix"
      ];
      isHelperEntrypointName = n: elem n helperEntrypointNames || hasSuffix "-options.nix" n;
      entrypointFor =
        n:
        let
          kind = entries.${n};
          path = dir + "/${n}";
        in
        if hasPrefix "_" n || isHelperEntrypointName n then
          null
        else if kind == "directory" && pathExists (path + "/default.nix") then
          path
        else if kind == "regular" && n != "default.nix" && hasSuffix ".nix" n then
          path
        else
          null;
    in
    filter (path: path != null) (map entrypointFor names);

  moduleEntrypointsFromDirs =
    root: dirs:
    concatLists (map (dir: moduleEntrypoints (root + "/${dir}")) dirs);

  moduleOptionPath =
    root: path:
    let
      rootString = toString root;
      pathString = toString path;
      rootPrefix = "${rootString}/";
      relative =
        if hasPrefix rootPrefix pathString then
          substring (stringLength rootPrefix) (stringLength pathString) pathString
        else
          pathString;
      parts = splitString "/" relative;
      lastPart = last parts;
      parentParts = init parts;
      normalizedParts =
        if lastPart == "default.nix" then
          parentParts
        else if hasSuffix ".nix" lastPart then
          parentParts ++ [ (removeSuffix ".nix" lastPart) ]
        else
          parts;
    in
    [ "indexyz" ] ++ normalizedParts;
```

- [ ] **Step 4: Verify helper eval passes**

Run the same command from Step 1.

Expected: PASS with JSON output:

```json
["moduleEntrypoints","moduleEntrypointsFromDirs","moduleOptionPath"]
```

- [ ] **Step 5: Verify option path conversion**

Run:

```bash
nix eval --impure --extra-experimental-features 'nix-command flakes' --json --expr '
let
  flake = builtins.getFlake "path:/home/indexyz/Projects/nixos";
  lib = flake.inputs.nixpkgs.lib;
  moduleLib = import ./lib/modules.nix {
    inherit lib;
    self.attrs = import ./lib/attrs.nix { inherit lib; self = {}; };
  };
in {
  ssh = moduleLib.moduleOptionPath ./modules ./modules/services/ssh.nix;
  tailscale = moduleLib.moduleOptionPath ./modules ./modules/network/tailscale/default.nix;
  git = moduleLib.moduleOptionPath ./home ./home/programs/git.nix;
}
'
```

Expected: PASS with JSON output:

```json
{"git":["indexyz","programs","git"],"ssh":["indexyz","services","ssh"],"tailscale":["indexyz","network","tailscale"]}
```

- [ ] **Step 6: Verify direct helper file names are filtered**

Run:

```bash
tmpdir="$(mktemp -d)"
mkdir -p "$tmpdir/root/allowed/real-dir"
touch "$tmpdir/root/allowed/real.nix"
touch "$tmpdir/root/allowed/real-dir/default.nix"
touch "$tmpdir/root/allowed/utils.nix"
touch "$tmpdir/root/allowed/library.nix"
touch "$tmpdir/root/allowed/models.nix"
touch "$tmpdir/root/allowed/rule-options.nix"
MODULE_ENTRYPOINT_TEST_ROOT="$tmpdir/root" nix eval --impure --extra-experimental-features 'nix-command flakes' --raw --expr '
let
  flake = builtins.getFlake "path:/home/indexyz/Projects/nixos";
  lib = flake.inputs.nixpkgs.lib;
  moduleLib = import ./lib/modules.nix {
    inherit lib;
    self.attrs = import ./lib/attrs.nix { inherit lib; self = {}; };
  };
  root = builtins.getEnv "MODULE_ENTRYPOINT_TEST_ROOT";
  prefix = root + "/allowed/";
  toRel = path:
    let pathString = toString path;
    in builtins.substring (builtins.stringLength prefix) (builtins.stringLength pathString) pathString;
in lib.concatStringsSep "\n" (map toRel (moduleLib.moduleEntrypoints (root + "/allowed")))
'
rm -rf "$tmpdir"
```

Expected: PASS with output:

```text
real-dir
real.nix
```

## Task 2: Generate NixOS Module Imports

**Files:**
- Modify: `modules/all-modules.nix`

**Interfaces:**
- Consumes: `moduleEntrypointsFromDirs ./modules [ string ] -> [ path ]`
- Produces: generated imports for `nixosModules.indexyz`

- [ ] **Step 1: Replace manual imports in `modules/all-modules.nix`**

Replace the file with:

```nix
{ lib, ... }:

let
  moduleLib = import ../lib/modules.nix {
    inherit lib;
    self.attrs = import ../lib/attrs.nix { inherit lib; self = { }; };
  };
in
{
  imports = moduleLib.moduleEntrypointsFromDirs ./. [
    "environment"
    "services"
    "devices"
    "desktop"
    "system"
    "network"
  ];
}
```

- [ ] **Step 2: Inspect generated NixOS entrypoints**

Run:

```bash
nix eval --impure --extra-experimental-features 'nix-command flakes' --raw --expr '
let
  flake = builtins.getFlake "path:/home/indexyz/Projects/nixos";
  lib = flake.inputs.nixpkgs.lib;
  moduleLib = import ./lib/modules.nix {
    inherit lib;
    self.attrs = import ./lib/attrs.nix { inherit lib; self = {}; };
  };
  prefix = (toString ./modules) + "/";
  toRel = path:
    let pathString = toString path;
    in builtins.substring (builtins.stringLength prefix) (builtins.stringLength pathString) pathString;
in lib.concatStringsSep "\n" (map toRel (moduleLib.moduleEntrypointsFromDirs ./modules [
  "environment"
  "services"
  "devices"
  "desktop"
  "system"
  "network"
]))
'
```

Expected: output includes these newly classified top-level modules:

```text
network/wireguard.nix
services/secrets
```

Expected: output does not include these parent-owned internals:

```text
network/tailscale/cert.nix
services/clash/subscribe-config.nix
services/libvirt/fixes/remove-default-network.nix
```

- [ ] **Step 3: Compare generated NixOS entrypoints with the old manual list**

Run:

```bash
old="$(mktemp)"
generated="$(mktemp)"
cat > "$old" <<'EOF'
desktop/font.nix
desktop/ime.nix
desktop/sway.nix
devices/mlx4-mode.nix
environment/acme
environment/base.nix
environment/efi.nix
environment/qemu.nix
environment/shell.nix
network/netclient.nix
network/nftables
network/tailscale
services/argo.nix
services/atftpd.nix
services/clash
services/cloudreve.nix
services/dhcp
services/dns
services/drone-docker.nix
services/drone-exec.nix
services/drone-web.nix
services/forwarding
services/frpc
services/frps
services/hpool-miner.nix
services/influxdb.nix
services/k3s.nix
services/ksmbd.nix
services/leaf.nix
services/libvirt
services/nginx.nix
services/novnc.nix
services/prometheus.nix
services/pufferpanel.nix
services/ssh.nix
services/teleport-agent.nix
services/transmission.nix
services/vlmcsd.nix
services/vouch.nix
services/vpncloud.nix
services/wiretrustee-client.nix
system/uboot
EOF
nix eval --impure --extra-experimental-features 'nix-command flakes' --raw --expr '
let
  flake = builtins.getFlake "path:/home/indexyz/Projects/nixos";
  lib = flake.inputs.nixpkgs.lib;
  moduleLib = import ./lib/modules.nix {
    inherit lib;
    self.attrs = import ./lib/attrs.nix { inherit lib; self = {}; };
  };
  prefix = (toString ./modules) + "/";
  toRel = path:
    let pathString = toString path;
    in builtins.substring (builtins.stringLength prefix) (builtins.stringLength pathString) pathString;
in lib.concatStringsSep "\n" (map toRel (moduleLib.moduleEntrypointsFromDirs ./modules [
  "environment"
  "services"
  "devices"
  "desktop"
  "system"
  "network"
]))
' | sort > "$generated"
printf 'Added:\n'
comm -13 "$old" "$generated"
printf 'Removed:\n'
comm -23 "$old" "$generated"
rm -f "$old" "$generated"
```

Expected: PASS with output:

```text
Added:
network/wireguard.nix
services/secrets
Removed:
```

This explicitly classifies `modules/network/wireguard.nix` and `modules/services/secrets/default.nix` as safely included top-level entrypoints when the NixOS module evaluation in the next step passes.

- [ ] **Step 4: Evaluate the exported NixOS module set**

Run:

```bash
nix eval --impure --extra-experimental-features 'nix-command flakes' --raw --expr '
let
  flake = builtins.getFlake "path:/home/indexyz/Projects/nixos";
  pkgs = import flake.inputs.nixpkgs { system = "x86_64-linux"; };
  evaluated = pkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      flake.nixosModules.indexyz
      ({ ... }: {
        system.stateVersion = "25.05";
        boot.loader.grub.enable = false;
        fileSystems."/".device = "none";
      })
    ];
  };
in evaluated.config.system.stateVersion
'
```

Expected: PASS with output:

```text
25.05
```

## Task 3: Generate Home Manager Program Imports

**Files:**
- Modify: `home/programs/default.nix`

**Interfaces:**
- Consumes: `moduleEntrypoints ./. -> [ path ]`
- Produces: generated imports for `home/all-modules.nix` through `./programs`

- [ ] **Step 1: Replace manual imports in `home/programs/default.nix`**

Replace the file with:

```nix
{ lib, ... }:

let
  moduleLib = import ../../lib/modules.nix {
    inherit lib;
    self.attrs = import ../../lib/attrs.nix { inherit lib; self = { }; };
  };
in
{
  imports = moduleLib.moduleEntrypoints ./.;
}
```

- [ ] **Step 2: Inspect generated Home Manager entrypoints**

Run:

```bash
nix eval --impure --extra-experimental-features 'nix-command flakes' --raw --expr '
let
  flake = builtins.getFlake "path:/home/indexyz/Projects/nixos";
  lib = flake.inputs.nixpkgs.lib;
  moduleLib = import ./lib/modules.nix {
    inherit lib;
    self.attrs = import ./lib/attrs.nix { inherit lib; self = {}; };
  };
  prefix = (toString ./home/programs) + "/";
  toRel = path:
    let pathString = toString path;
    in builtins.substring (builtins.stringLength prefix) (builtins.stringLength pathString) pathString;
in lib.concatStringsSep "\n" (map toRel (moduleLib.moduleEntrypoints ./home/programs))
'
```

Expected: output is exactly these files in deterministic order:

```text
alacritty.nix
direnv.nix
git.nix
nvim.nix
sway.nix
vscode.nix
waybar.nix
```

- [ ] **Step 3: Evaluate the exported Home Manager module set with all local program modules disabled**

Run:

```bash
nix eval --impure --extra-experimental-features 'nix-command flakes' --json --expr '
let
  flake = builtins.getFlake "path:/home/indexyz/Projects/nixos";
  pkgs = import flake.inputs.nixpkgs { system = "x86_64-linux"; };
  evaluated = pkgs.lib.evalModules {
    specialArgs = { inherit pkgs; };
    modules = [
      flake.homeModules.indexyz
      ({ ... }: {
        indexyz.programs.alacritty.enable = false;
        indexyz.programs.direnv.enable = false;
        indexyz.programs.git.enable = false;
        indexyz.programs.nvim.enable = false;
        indexyz.programs.sway.enable = false;
        indexyz.programs.vscode.enable = false;
        indexyz.programs.waybar.enable = false;
      })
    ];
  };
in builtins.attrNames evaluated.options.indexyz.programs
'
```

Expected: PASS with JSON output:

```json
["alacritty","direnv","git","nvim","sway","vscode","waybar"]
```

## Task 4: Document, Format, and Run Final Verification

**Files:**
- Modify: `README.md`
- Modify: `docs/superpowers/plans/2026-06-30-module-autodiscovery.md` only for checkbox status updates during execution

**Interfaces:**
- Consumes: implemented scanner and aggregators
- Produces: documented module discovery convention and final verification evidence

- [ ] **Step 1: Add module discovery docs to `README.md`**

Append this section after the setup section:

```markdown
## Module Discovery

NixOS modules are exported through `modules/all-modules.nix`. The aggregator discovers module entrypoints under these top-level directories: `environment`, `services`, `devices`, `desktop`, `system`, and `network`.

A module entrypoint is either a direct `.nix` file under one of those directories or a direct child directory with a `default.nix`. Nested files inside an entrypoint directory are treated as internals owned by that parent module and are not imported directly by `all-modules.nix`.

Home Manager program modules follow the same entrypoint rule under `home/programs`.
```

- [ ] **Step 2: Format changed Nix files**

Run:

```bash
nixpkgs-fmt lib/modules.nix modules/all-modules.nix home/programs/default.nix
```

Expected: command exits 0 and leaves files formatted.

- [ ] **Step 3: Run targeted scanner checks**

Run the generated NixOS entrypoint inspection command from Task 2 Step 2.

Expected: output includes `network/wireguard.nix` and `services/secrets`, and does not include parent-owned internals.

Run the generated Home Manager entrypoint inspection command from Task 3 Step 2.

Expected: output exactly matches the seven Home Manager program files listed in Task 3 Step 2.

- [ ] **Step 4: Run module evaluation checks**

Run the NixOS eval command from Task 2 Step 3.

Expected: PASS with `25.05`.

Run the Home Manager eval command from Task 3 Step 3.

Expected: PASS with the expected seven option names.

- [ ] **Step 5: Attempt full flake check**

Run:

```bash
nix flake check --extra-experimental-features 'nix-command flakes'
```

Expected: PASS. If this command is blocked by unrelated package builds, network access, or runtime duration, record the exact failure and rely on the targeted scanner and module evaluation checks from Steps 3 and 4.

- [ ] **Step 6: Review final diff**

Run:

```bash
git status --short
git diff -- lib/modules.nix modules/all-modules.nix home/programs/default.nix README.md docs/superpowers/plans/2026-06-30-module-autodiscovery.md
```

Expected: only intended files changed, with no unrelated worktree changes included.
