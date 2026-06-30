# Module Autodiscovery Design

## Goal

Refactor module collection so `all-modules.nix` files do not need manual updates when a supported module file is added, while preserving the existing public option names.

This covers two module collections:

- `modules/all-modules.nix` for the main NixOS module set exported as `nixosModules.indexyz`.
- `home/all-modules.nix` for the Home Manager module set exported as `homeModules.indexyz`.

## Non-Goals

This design does not rename existing options to force every option path to match its file path. Existing exceptions stay compatible, including:

- `modules/network/nftables/default.nix` defining `indexyz.network.firewall`.
- `modules/system/uboot/default.nix` defining `indexyz.boot.loader.uboot`.
- `modules/environment/shell.nix` extending behavior under `indexyz.environment.base`.

This design also does not fold Darwin or installer modules into the main NixOS module collection.

## Current State

`modules/all-modules.nix` manually lists each imported NixOS module. `home/all-modules.nix` imports `home/programs/default.nix`, and `home/programs/default.nix` manually lists each Home Manager program module.

The repository already has `lib/modules.nix`, which can map module paths. However, a raw recursive scan of `modules` would be unsafe because the tree contains helper files and submodule definitions that are not top-level NixOS modules, such as `utils.nix`, `models.nix`, `*-options.nix`, and libvirt device helpers.

## Proposed Approach

Add a shared scanner that accepts a root path and an allowlist of top-level directories. The scanner returns importable module paths only.

For `modules/all-modules.nix`, the allowlist is:

- `environment`
- `services`
- `devices`
- `desktop`
- `system`
- `network`

The scanner excludes these paths or path patterns:

- `modules/darwin/**`
- `modules/installer/**`
- files named `utils.nix`, `library.nix`, or `models.nix`
- files ending in `-options.nix`
- known helper-only subtrees such as `modules/services/libvirt/devices/**` and `modules/services/libvirt/tools/**`

For `home/all-modules.nix`, the scanner imports Home Manager modules under `home/programs` while avoiding `home/programs/default.nix` as a duplicate aggregator.

## Option Name Helper

Add a small path-derived option helper for future modules. The helper should convert a module path relative to its collection root into an option attr path under `indexyz`, stripping `default.nix` and `.nix`.

Examples:

- `services/ssh.nix` -> `[ "indexyz" "services" "ssh" ]`
- `network/tailscale/default.nix` -> `[ "indexyz" "network" "tailscale" ]`
- `programs/git.nix` in the Home Manager collection -> `[ "indexyz" "programs" "git" ]`

Existing modules are not required to migrate immediately. Compatibility is more important than forcing path purity in this change.

## Data Flow

1. Flake exports import `modules/all-modules.nix` and `home/all-modules.nix` exactly as they do today.
2. Each `all-modules.nix` calls the shared scanner with its collection root and filters.
3. The scanner returns a deterministic sorted list of import paths.
4. The module system imports that list.

## Error Handling

The scanner should prefer explicit filtering over guessing from file contents. Helper files must not be imported as top-level modules. If a new helper naming pattern appears later, it should be added to the exclusion list instead of relying on fragile text inspection.

The generated import list must be deterministic to avoid evaluation churn.

## Testing

Verification should include:

- Formatting changed Nix files with the repo formatter.
- Evaluating `nixosModules.indexyz` through `nix flake check` when feasible.
- Evaluating `homeModules.indexyz` enough to confirm the generated imports are syntactically valid and do not import helper-only files.

If full flake checks are too slow or blocked by unrelated package builds, use narrower `nix eval` commands for the module exports and report the limitation.

## Rollout

Implement this as a compatibility-preserving refactor:

1. Add the scanner/helper library.
2. Replace manual imports in `modules/all-modules.nix`.
3. Replace manual imports in `home/all-modules.nix` or `home/programs/default.nix`.
4. Verify generated imports against the previous manual module set, excluding intentional non-main modules.
5. Run formatting and Nix evaluation checks.
