{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.indexyz.services.drone-web;
  ociCfg = config.virtualisation.oci-containers;
  runtimeEnvFile = "/run/drone-web-run-env";
in
{
  options = {
    indexyz.services.drone-web = {
      enable = mkEnableOption "Enable drone web";

      port = mkOption {
        default = 5905;
        type = types.int;
        description = "Drone ci web interface location";
      };

      rpcSecretFile = mkOption {
        type = types.str;
        example = "/run/drone/rpc_secret";
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

      extraSettings = mkOption {
        type = types.attrs;
        default = { };
        description = ''
          Extra settings, see also: https://docs.drone.io/server/provider/

          Example:
          {
            DRONE_GITHUB_CLIENT_ID = "GitHub Client";
            DRONE_GITHUB_CLIENT_SECRET = "GitHub Secret";
          }
        '';
      };

      secretEnvFile = mkOption {
        type = with types; nullOr str;
        default = null;
        description = ''
          Env file that load to drone every time boot
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    virtualisation.oci-containers.containers.drone-web = {
      image = "drone/drone:2.6.0";
      ports = [
        "${toString cfg.port}:80"
      ];
      volumes = [
        "${cfg.workDir}:/data"
      ];

      environment = {
        DRONE_SERVER_HOST = cfg.serverHost;
        DRONE_SERVER_PROTO = cfg.serverProto;
      } // cfg.extraSettings;

      environmentFiles = [ runtimeEnvFile ];
    };

    systemd.services."${ociCfg.backend}-drone-web".preStart = lib.mkBefore ''
      mkdir -p ${cfg.workDir}
      rm -f ${runtimeEnvFile}
      ${optionalString (cfg.secretEnvFile != null) ''
        cat ${cfg.secretEnvFile} > ${runtimeEnvFile}
        echo "" >> ${runtimeEnvFile}
      ''}
      cat ${cfg.rpcSecretFile} | ${pkgs.gawk}/bin/gawk '{print "DRONE_RPC_SECRET="$0}' >> ${runtimeEnvFile}
    '';
  };
}
