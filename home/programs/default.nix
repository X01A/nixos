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
