{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.indexyz.programs.direnv;
in
{
  options = {
    indexyz.programs.direnv.enable = mkOption {
      default = true;
      type = with types; bool;
    };
  };

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
    };
  };
}
