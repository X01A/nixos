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
