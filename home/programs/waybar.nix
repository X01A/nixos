{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.indexyz.programs.waybar;
  mainSettings = {
    layer = "top";
    position = "top";
    height = 30;

    modules-left = [ "sway/workspaces" "sway/mode" "sway/window" ];
    modules-center = [ ];
    modules-right = [ "idle_inhibitor" "pulseaudio" "network" "cpu" "memory" "temperature" "backlight" ]
      ++ [ "battery" "clock" "tray" ];

    modules = {
      "sway/mode" = {
        format = "<span style=\"italic\">{}</span>";
      };
      idle_inhibitor = {
        format = "{icon}";
        format-icons = {
          activated = "";
          deactivated = "";
        };
      };
      tray = {
        # "icon-size" = 21;
        "spacing" = 10;
      };
      clock = {
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "{:%Y-%m-%d}";
      };
      cpu = {
        "format" = "{usage}% ";
        "tooltip" = false;
      };
      memory = {
        "format" = "{}% ";
      };
      temperature = {
        # "thermal-zone" = 2;
        # hwmon-path = cfg.gui.waybar.hwmon-path;
        critical-threshold = 80;
        format-critical = "!{temperatureC}°C {icon}";
        format = "{temperatureC}°C {icon}";
        format-icons = [ "" "" "" ];
      };
      backlight = {
        format = "{percent}% {icon}";
        format-icons = [ "" "" ];
      };
      battery = {
        states = {
          # "good" = 95;
          warning = 30;
          critical = 15;
        };
        format = "{capacity}% {icon}";
        format-charging = "{capacity}% ";
        format-plugged = "{capacity}% ";
        format-alt = "{time} {icon}";
        # "format-good" = "" # An empty format will hide the module
        # "format-full" = "";
        format-icons = [ "" "" "" "" "" ];
      };
      network = {
        # "interface" = "wlp2*" # (Optional) To force the use of this interface
        format-wifi = "{essid} ({signalStrength}%) ";
        format-ethernet = "{ifname} = {ipaddr}/{cidr} ";
        format-linked = "{ifname} (No IP) ";
        format-disconnected = "Disconnected ⚠";
        format-alt = "{ifname} = {ipaddr}/{cidr}";
      };
      pulseaudio = {
        # "scroll-step" = 1 # % can be a float
        format = "{volume}% {icon} {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-muted = " {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [ "" "" "" ];
        };
        on-click = "pavucontrol";
      };
    };
  };
in
{
  options = {
    indexyz.programs.waybar.enable = mkOption {
      default = false;
      type = with types; bool;
    };
  };

  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
      settings.main = mainSettings;
    };
  };
}
