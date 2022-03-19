{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.desktop.font;
in
{
  options = {
    indexyz.desktop.font = {
      enable = mkEnableOption "Enable desktop fonts";
    };
  };

  config = mkIf cfg.enable {
    fonts = {
      enableDefaultFonts = true;
      enableGhostscriptFonts = true;

      fonts = with pkgs; [
        roboto
        jetbrains-mono
        noto-fonts-cjk
        noto-fonts-extra
        noto-fonts-emoji
        wqy_microhei
        wqy_zenhei
        cascadia-code
        iosevka-bin

        (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
      ];

      fontconfig = {
        enable = true;
        localConf = (builtins.readFile ./fontconfig.xml);
      };
    };
  };
}
