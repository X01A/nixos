{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.desktop.sway;
in
{
  options = {
    indexyz.desktop.sway = {
      enable = mkEnableOption "Enable sway";
    };
  };

  config = mkIf cfg.enable {
    programs.sway.enable = true;

    security.pam.services.swaylock = {
      text = ''
        auth include login
      '';
  };
}
