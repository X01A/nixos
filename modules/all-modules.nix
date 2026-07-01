{ lib, ... }:

let
  moduleLib = import ../lib/modules.nix {
    inherit lib;
    self.attrs = import ../lib/attrs.nix { inherit lib; self = { }; };
  };

  excludedEntrypoints = [
    # Requires a deployment module declaring deployment.*; unsafe in plain NixOS eval.
    ./services/secrets
  ];

  generatedEntrypoints = moduleLib.moduleEntrypointsFromDirs ./. [
    "environment"
    "services"
    "devices"
    "desktop"
    "system"
    "network"
  ];
in
{
  imports = lib.subtractLists excludedEntrypoints generatedEntrypoints;
}
