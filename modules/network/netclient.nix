{ pkgs, config, lib, ... }:

with lib;
let
  cfg = config.indexyz.network.netclient;
  servicePath = with pkgs; [
    iptables
    iproute2
    procps
    wireguard-tools
  ];
in
{
  options = {
    indexyz.network.netclient = {
      enable = mkEnableOption "Enable netclient daemon";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      netmaker
    ];

    boot.kernel.sysctl = {
      "net.ipv4.ip_forward" = mkDefault 1;
      "net.ipv4.conf.all.src_valid_mark" = mkDefault 1;
      "net.ipv6.conf.all.forwarding" = mkDefault 1;
    };

    systemd.services.netclient = {
      description = "Netmaker client";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      script = ''
        exec ${pkgs.netmaker}/bin/netclient daemon
      '';
      path = servicePath;
    };

    # Workaround form https://github.com/gravitl/netmaker/issues/999
    # Remove service and timer if resloved
    systemd.services.netclient-pull = {
      after = [ "network.target" "network-online.target" "netclient.service" ];
      wants = [ "netclient.service" "netclient-pull.timer" ];
      wantedBy = [ "multi-user.target" ];
      path = servicePath;
      script = ''
        exec ${pkgs.netmaker}/bin/netclient pull -n all
      '';
    };

    systemd.timers.netclient-pull = {
      wantedBy = [ "timers.target" ];
      description = "Renew tailscale server cert";
      timerConfig = {
        OnCalendar = "*:*:0/15";
        Unit = "netclient-pull.service";
      };
    };
  };
}
