{ pkgs, config, lib, ... }:

with lib;
let
  cfg = config.indexyz.network.netclient;
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
      "net.ipv4.ip_forward" = 1;
      "net.ipv4.conf.all.src_valid_mark" = 1;
      "net.ipv6.conf.all.disable_ipv6" = 0;
      "net.ipv6.conf.all.forwarding" = 1;
    };

    systemd.services.netclient = {
      description = "Netmaker client";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      script = ''
        exec ${pkgs.netmaker}/bin/netclient daemon
      '';
      path = with pkgs; [
        iptables
        iproute2
        procps
        wireguard-tools
      ];
    };
  };
}
