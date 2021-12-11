{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.desktop.ime;
in
{
  options = {
    indexyz.desktop.ime = {
      enable = mkEnableOption "Enable ime";
    };
  };

  config = mkIf cfg.enable {
    i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-rime
        fcitx5-material-color
      ];
    };

    # Run fcitx daemon in xserver session
    systemd.user.services.fcitx5-daemon.enable = lib.mkForce false;
  }
}
