{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.indexyz.programs.sway;

  alt = "Mod1";
  modifier = "Mod4";

  workspaceKeybinds = builtins.listToAttrs (lists.flatten (map
    (number: [
      {
        name = "Ctrl+${toString number}";
        value = "workspace number ${toString number}";
      }
    ])
    (lists.range 1 9)));

  keybindings = lib.mkOptionDefault
    ({
      XF86MonBrightnessDown = "exec brightnessctl set 5%-";
      XF86MonBrightnessUp = "exec brightnessctl set +5%";

      XF86AudioRaiseVolume = "exec 'pactl set-sink-volume @DEFAULT_SINK@ +5%'";
      XF86AudioLowerVolume = "exec 'pactl set-sink-volume @DEFAULT_SINK@ -5%'";
      XF86AudioMute = "exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'";
      Print = "exec ${pkgs.grim}/bin/grim -t png - | wl-copy -t image/png";

      "${alt}+Shift+l" = "exec swaylock -f -c 000000";
      "Ctrl+Shift+q" = "kill";
      "Ctrl+r" = "exec --no-startup-id rofi -show drun -drun-show-actions -p 'app:' -L 10";
      "Ctrl+Shift+r" = "exec --no-startup-id rofi -show run -p 'shell:' -L 10";
      "Ctrl+Return" = "exec alacritty";
    } // workspaceKeybinds);
in
{
  options = {
    indexyz.programs.sway.enable = mkOption {
      default = true;
      type = with types; bool;
    };
  };

  config = mkIf cfg.enable {
    xsession.preferStatusNotifierItems = true;

    home.packages = with pkgs; [
      pulseaudio
      rofi-wayland
      brightnessctl
      pavucontrol
      gnome3.adwaita-icon-theme
      grim
      wl-clipboard
      maim
    ];

    wayland.windowManager.sway = {
      enable = true;
      config = {
        modifier = modifier;
        output = { };
        bars = [ ];
        startup = [
          {
            command = ''
              swayidle -w \
              timeout 5 'if pgrep -x swaylock; then swaymsg "output * dpms off"; fi' \
                  resume 'swaymsg "output * dpms on"' \
              before-sleep 'swaylock -f -F -c 000000' \
              lock 'swaylock -f -F -c 000000'
            '';
            always = true;
          }
        ];
        terminal = "alacritty";

        keybindings = keybindings;
      };
      extraOptions = [
        "--debug"
        "--unsupported-gpu"
      ];
      wrapperFeatures = {
        gtk = true;
      };
      extraConfig = ''
        # https://github.com/ValveSoftware/steam-for-linux/issues/1040
        for_window [class="^Steam$" title="^Friends$"] floating enable
        for_window [class="^Steam$" title="Steam - News"] floating enable
        for_window [class="^Steam$" title=".* - Chat"] floating enable
        for_window [class="^Steam$" title="^Settings$"] floating enable
        for_window [class="^Steam$" title=".* - event started"] floating enable
        for_window [class="^Steam$" title=".* CD key"] floating enable
        for_window [class="^Steam$" title="^Steam - Self Updater$"] floating enable
        for_window [class="^Steam$" title="^Screenshot Uploader$"] floating enable
        for_window [class="^Steam$" title="^Steam Guard - Computer Authorization Required$"] floating enable
        for_window [title="^Steam Keyboard$"] floating enable

        for_window [title="^(File|Folder)\s*Already Exists\s*—\s*" app_id="org.kde.dolphin|org.kde.ark"] floating enable
        for_window [title="^(Copying|Moving)\s*—\s*Dolphin" app_id="org.kde.dolphin"] floating enable
        for_window [title="^Extracting\s" app_id="(org.kde.dolphin|org.kde.ark)"] floating enable
        for_window [title="^Information\s*—\s*Dolphin" app_id="org.kde.dolphin"] floating enable
        for_window [title="^Loading archive" app_id="org.kde.ark"] floating enable

        seat * xcursor_theme Adwaita
        input type:touchpad {
          tap enabled
          natural_scroll enabled
        }
      '';
    };
  };
}
