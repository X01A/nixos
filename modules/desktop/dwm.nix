{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.desktop.dwm;
in
{
  options = {
    indexyz.desktop.dwm = {
      enable = mkEnableOption "Enable dwm desktop env";
    };
  };

  config = mkIf cfg.enable {
    services.xserver = {
      enable = true;
      displayManager.sddm.enable = true;
    };

    services.xserver.windowManager.session = singleton {
      name = "dwm";
      start = ''
        ${optionalString config.indexyz.desktop.ime.enable ''
          ${config.i18n.inputMethod.package}/bin/fcitx5 -d
        ''}
        ${pkgs.xorg.xrdb}/bin/xrdb -merge ~/.Xresources
        # Disaple xorg dpms sleep
        xset s off -dpms

        # Mouse speed
        xset m 1
        ${pkgs.valgrind}/bin/valgrind --log-file=/tmp/dwm-crash.log dwm &
        waitPID=$!
      '';
    };

    environment.variables = {
      # Fix jetbrains and java apps
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };

    # slstatus
    systemd.user.services.slstatus = {
      enable = true;
      script = "${pkgs.slstatus-index}/bin/slstatus";
      wantedBy = [ "graphical-session.target" ];
    };


    environment.systemPackages = with pkgs; [
      dwm-index
      rofi
      maim
      xclip
      zbar
      layoutmenu
    ];

    # Run fcitx daemon in xserver session
    systemd.user.services.fcitx5-daemon.enable = lib.mkForce false;

    # Wallpaper
    systemd.user.services.wallpaper = {
      enable = true;
      script = ''
        ${pkgs.feh}/bin/feh ~/Pictures/Wallpaper/ --bg-fill --no-fehbg --randomize
      '';
      wantedBy = [ "graphical-session.target" ];
    };

    services.gnome.gnome-keyring.enable = false;
    programs.dconf.enable = true;

    # Fix QT Icon outside KDE
    programs.qt5ct.enable = true;
  };
}
