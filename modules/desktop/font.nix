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
        iosevka

        (nerdfonts.override { fonts = [ "CascadiaCode" ]; })
      ];

      fontconfig = {
        enable = true;
        localConf = ''
          <?xml version="1.0"?>
          <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
          <fontconfig>
            <alias>
              <family>sans-serif</family>
              <prefer>
                <family>Noto Sans Display</family>
                <family>Noto Sans CJK SC</family>
                <family>Noto Sans CJK HK</family>
                <family>Noto Sans CJK JP</family>
                <family>Noto Sans CJK KR</family>
                <family>Noto Sans CJK TC</family>
              </prefer>
            </alias>

            <alias>
              <family>monospace</family>
              <prefer>
                <family>Noto Sans Mono CJK SC</family>
                <family>Noto Sans Mono CJK TC</family>
                <family>Noto Sans Mono CJK JP</family>
              </prefer>
            </alias>
          </fontconfig>
        '';
      };
    };
  };
}
