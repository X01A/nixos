{ pkgs, config, lib, ... }:

with lib;
let
  cfg = config.indexyz.services.vpncloud;

  peerStr = peer: "-c ${peer}";
  peers = concatStringsSep " " (map peerStr cfg.peers);
in
{
  options = {
    indexyz.services.vpncloud = {
      enable = mkEnableOption "Enable vpncloud service";

      port = mkOption {
        default = 20001;
        type = types.int;
        description = "VPNCloud listen port";
      };

      ip = mkOption {
        type = types.str;
        description = "VPNCloud interface ip";
        example = "192.168.100.1/24";
      };

      passwordFile = mkOption {
        type = types.str;
        description = "VPNCloud password file";
        example = "/run/keys/VPN_CLOUD_PASS";
      };

      mode = mkOption {
        default = "normal";
        type = types.enum [ "normal" "router" "switch" "hub" ];
        description = "The mode of the VPN";
      };

      device = mkOption {
        default = "vpncloud0";
        type = types.str;
        description = "Name of the virtual device";
      };

      deviceType = mkOption {
        default = "tun";
        type = types.enum [ "tun" "tap" ];
        description = "Set the type of network";
      };

      peers = mkOption {
        default = [ ];
        type = with types; listOf str;
        description = "Address of a peer to connect to";
      };
    };
  };

  config = mkIf cfg.enable {
    networking.firewall.allowedUDPPorts = [ cfg.port ];
    # Allow forwarding
    boot.kernel.sysctl."net.ipv4.ip_forward" = "1";

    systemd.services.vpncloud = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        Restart = "always";
        RestartSec = 30;
      };

      script = ''
        ${pkgs.vpncloud}/bin/vpncloud \
          -p $(cat ${cfg.passwordFile}) --ip ${cfg.ip} \
          -l ${toString cfg.port} -m ${cfg.mode} -t ${cfg.deviceType} -d ${cfg.device} ${peers}
      '';
    };
  };
}
