{
  config,
  pkgs,
  lib,
  ...
}:

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
        noto-fonts-emoji-blob-bin
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
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
