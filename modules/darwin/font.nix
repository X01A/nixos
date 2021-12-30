{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.environment.font;
in
{
  options = {
    indexyz.environment.font = {
      enable = mkEnableOption "Enable font environment";
    };
  };

  config = mkIf cfg.enable {
    fonts = {
      enableFontDir = true;
      fonts = with pkgs; [
        cascadia-code
        iosevka-bin
        jetbrains-mono
        sarasa-gothic
      ];
    };
  };
}
