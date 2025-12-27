{ inputs, ... }:
let
  inherit (inputs) nixpkgs;
  inherit (nixpkgs) lib;

  inherit (lib) makeExtensible attrValues foldr;

  modules = import ./modules.nix {
    inherit lib;
    self.attrs = import ./attrs.nix {
      inherit lib;
      self = { };
    };
  };
  inherit (modules) mapModules;

  selfLib = makeExtensible (
    self:
    with self;
    mapModules ./. (
      file:
      import file {
        inherit
          self
          lib
          pkgs
          inputs
          ;
      }
    )
  );
in
{
  flake.lib = lib.extend (
    self: _super: {
      self = selfLib.extend (_self: super: foldr (a: b: a // b) { } (attrValues super));
    }
  );
}
