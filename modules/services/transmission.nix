{ config, pkgs, lib, ... }:


with lib;
let
  cfg = config.indexyz.services.transmission;
in
{
  options = {
    indexyz.services.transmission = {
      enable = mkEnableOption "Enable transmission server";

      downloadDir = mkOption {
        default = "/var/lib/transmission";
        type = types.str;
      };

      openPort = mkOption {
        default = false;
        type = types.bool;
      };

      portNumber = mkOption {
        default = 9091;
        type = types.int;
      };
    };
  };

  config = mkIf cfg.enable (lib.mkMerge [
    ({
      services.transmission = {
        enable = true;
        settings = {
          download-dir = cfg.downloadDir;
          rpc-enabled = true;
          rpc-whitelist = "127.0.0.1,192.168.*.*";
          rpc-authentication-required = false;
          rpc-bind-address = "0.0.0.0";
          rpc-host-whitelist-enabled = false;
          peer-port = 51413;
          incomplete-dir-enabled = false;
          preallocation = 0;
          rpc-port = cfg.portNumber;
        };
      };

      networking.firewall.allowedTCPPorts = [ 51413 ];
      networking.firewall.allowedUDPPorts = [ 51413 ];

      # Set webui home
      systemd.services.transmission.environment.TRANSMISSION_WEB_HOME = "${pkgs.transmission-web-control}/src";
    })

    (lib.mkIf (cfg.openPort) {
      networking.firewall.allowedTCPPorts = [ 9091 ];
    })
  ]);
}
