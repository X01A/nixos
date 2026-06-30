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

Some existing top-level modules live in allowed directories but are not currently listed in `modules/all-modules.nix`, including `modules/network/wireguard.nix` and `modules/services/secrets/default.nix`. The implementation must classify these explicitly instead of letting them appear as accidental scope changes.

## Proposed Approach

Add a shared scanner that accepts a root path and an allowlist of top-level directories. The scanner returns importable module entrypoints only.

An entrypoint is one of:

- a direct `.nix` file under an allowed directory, excluding `default.nix`; or
- a direct child directory under an allowed directory that contains `default.nix`.

The scanner must not recursively import every `.nix` file under an entrypoint directory. Files inside an entrypoint directory remain owned by that parent module and are imported only when the parent module imports them.

For `modules/all-modules.nix`, the allowlist is:

- `environment`
- `services`
- `devices`
- `desktop`
- `system`
- `network`

The scanner excludes these paths or path patterns before entrypoint discovery:

- `modules/darwin/**`
- `modules/installer/**`
- files named `utils.nix`, `library.nix`, or `models.nix`
- files ending in `-options.nix`
- known helper-only subtrees such as `modules/services/libvirt/devices/**` and `modules/services/libvirt/tools/**` if a future scanner mode ever traverses below entrypoints

The following nested files are examples of parent-owned module internals, not `all-modules.nix` entrypoints:

- `modules/services/clash/subscribe-config.nix`
- `modules/network/tailscale/cert.nix`
- `modules/services/libvirt/fixes/remove-default-network.nix`

For `home/all-modules.nix`, the scanner imports Home Manager modules under `home/programs` while avoiding `home/programs/default.nix` as a duplicate aggregator.

Existing top-level modules under the allowlist that were previously omitted from the manual import list should be imported by the scanner if they evaluate safely while disabled. Current candidates are:

- `modules/network/wireguard.nix`
- `modules/services/secrets/default.nix`

If either candidate cannot be imported safely without deployment-specific context, add it to an explicit exclusion list and document the reason in the scanner configuration.

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
3. The scanner returns a deterministic sorted list of entrypoint import paths.
4. The module system imports that list.

## Error Handling

The scanner should prefer explicit filtering over guessing from file contents. Helper files must not be imported as top-level modules. If a new helper naming pattern appears later, it should be added to the exclusion list instead of relying on fragile text inspection.

The generated import list must be deterministic to avoid evaluation churn.

## Safety and Rollback

This refactor should be reversible by restoring the previous manual import lists in `modules/all-modules.nix`, `home/all-modules.nix`, and `home/programs/default.nix` if generated imports break evaluation.

During implementation, generate or inspect the scanner output before relying on it. Any newly discovered entrypoint that fails disabled evaluation or requires deployment-specific context must be contained by adding it to an explicit exclusion list with a short reason in code. Do not leave an unsafe entrypoint to fail only during downstream host evaluation.

Because the change preserves option names and only changes how module entrypoints are collected, rollback should not require option migrations or host configuration changes.

## Docs Impact

Update repository documentation if module authors need to follow a new convention for automatic discovery. At minimum, document the entrypoint convention somewhere durable, either in `README.md` or in a focused module authoring note:

- direct `.nix` files under allowed module directories are auto-imported;
- direct child directories with `default.nix` under allowed module directories are auto-imported;
- nested files inside an entrypoint directory are parent-owned internals and are not auto-imported by `all-modules.nix`.

If no public-facing README change is appropriate, document the convention in code comments near the scanner configuration.

## Acceptance Criteria

The implementation is complete when:

- `modules/all-modules.nix` no longer needs manual edits for new supported NixOS module entrypoints under the allowed directories.
- `home/all-modules.nix` no longer needs manual edits for new Home Manager program module entrypoints.
- Existing public option names remain unchanged.
- Darwin, installer, helper-only, submodule-only, and parent-owned internal files are not imported into the main NixOS module set.
- Scanner output is deterministic.
- The generated NixOS entrypoint list is compared with the old manual list, and `network/wireguard.nix` plus `services/secrets/default.nix` are either safely included or explicitly excluded with a reason.
- Verification commands show the exported NixOS and Home Manager module sets evaluate, or any narrower fallback verification is reported with the reason full checks were not feasible.

## Testing

Verification should include:

- Formatting changed Nix files with the repo formatter.
- Evaluating `nixosModules.indexyz` through `nix flake check` when feasible.
- Evaluating `homeModules.indexyz` enough to confirm the generated imports are syntactically valid and do not import helper-only files.
- Checking the generated NixOS import list against the old manual list and explicitly reporting newly included top-level modules such as `network/wireguard.nix` and `services/secrets/default.nix`.

If full flake checks are too slow or blocked by unrelated package builds, use narrower `nix eval` commands for the module exports and report the limitation.

## Rollout

Implement this as a compatibility-preserving refactor:

1. Add the scanner/helper library.
2. Replace manual imports in `modules/all-modules.nix`.
3. Replace manual imports in `home/all-modules.nix` or `home/programs/default.nix`.
4. Verify generated imports against the previous manual module set, excluding intentional non-main modules.
5. Run formatting and Nix evaluation checks.
