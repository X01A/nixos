{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.indexyz.services.drone-web;
in
{
  options = {
    indexyz.services.drone-web = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };

      port = mkOption {
        default = 5905;
        type = types.int;
        description = "Drone ci web interface location";
      };

      rpcSecret = mkOption {
        type = types.str;
        description = ''
          Secret to authenticate communication between runners and your central Drone server.
          You can use openssl to generate a shared secret:

          $ openssl rand -hex 16
        '';
      };


      serverProto = mkOption {
        default = "https";
        type = types.enum [ "http" "https" ];
      };

      serverHost = mkOption {
        type = types.str;
      };

      workDir = mkOption {
        type = types.str;
        default = "/var/lib/drone";
        description = "Data store location";
      };

      scmSettings = mkOption
        {
          type = types.attrs;
          default = { };
          description = ''
            SCM settings, see also: https://docs.drone.io/server/provider/

            Example:
            {
              DRONE_GITHUB_CLIENT_ID = "GitHub Client";
              DRONE_GITHUB_CLIENT_SECRET = "GitHub Secret";
            }
          '';
        }
        };
    };

    config = mkIf cfg.enable {
      system.activationScripts.drone-web = ''
        # Make sure drone data dir exist
        mkdir -p ${cfg.workDir}
      '';

      virtualisation.oci-containers.containers.drone = {
        image = "drone/drone:2.0.1";
        ports = [
          "${toString cfg.port}:80"
        ];
        volumes = [
          "/var/lib/drone:/data"
        ];

        environment = {
          DRONE_RPC_SECRET = cfg.rpcSecret;
          DRONE_SERVER_HOST = cfg.serverHost;
          DRONE_SERVER_PROTO = cfg.serverProto;
        } // scmSettings;
      };
    };
  }
