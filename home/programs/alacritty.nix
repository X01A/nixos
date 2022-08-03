{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.indexyz.programs.alacritty;
in
{
  options = {
    indexyz.programs.alacritty.enable = mkOption {
      default = false;
      type = with types; bool;
    };
  };

  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        window = {
          padding = { x = 10; y = 10; };
          dimensions = {
            columns = 80;
            lines = 20;
          };
        };
        font = {
          size = 12;
          normal.family = "iosevka";
        };
      };
    };
  };
}
