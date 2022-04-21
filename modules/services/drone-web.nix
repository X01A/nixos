{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.indexyz.services.drone-web;
  ociCfg = config.virtualisation.oci-containers;
  envLoad = "/run/drone/env";
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
        default = "localhost";
        type = types.str;
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

      package = mkOption {
        default = pkgs.drone-oss;
        example = "pkgs.drone";
        type = types.package;
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.services.drone = {
      description = "Drone is a Container-Native, Continuous Delivery Platform";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];

      script = ''
        rm -f ${envLoad}
        ${optionalString (cfg.secretEnvFile != null) ''
          cat $CREDENTIALS_DIRECTORY/envFile > ${envLoad}
          echo "" >> ${envLoad}
        ''}

        cat $CREDENTIALS_DIRECTORY/rpcSecret | ${pkgs.gawk}/bin/gawk '{print "DRONE_RPC_SECRET="$0}' >> ${envLoad}
        exec ${cfg.package}/bin/drone-server -env-file ${envLoad}
      '';

      environment = {
        DRONE_SERVER_HOST = cfg.serverHost;
        DRONE_SERVER_PROTO = cfg.serverProto;
        DRONE_SERVER_PORT = ":${builtins.toString cfg.port}";
        DRONE_DATADOG_ENABLED = "false";
      } // cfg.extraSettings;

      serviceConfig = {
        NoNewPrivileges = true;
        DynamicUser = true;
        ProtectHome = true;
        ProtectHostname = true;
        ProtectKernelLogs = true;
        RemoveIPC = true;
        RestrictNamespaces = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        StateDirectory = "drone";
        RuntimeDirectory = "drone";
        RuntimeDirectoryPreserve = "yes";
        WorkingDirectory = "/var/lib/drone";
        StateDirectoryMode = "0700";
        LoadCredential = [
          "rpcSecret:${cfg.rpcSecretFile}"
        ] ++ (if (cfg.secretEnvFile != null) then [
          "envFile:${cfg.secretEnvFile}"
        ] else [ ]);
      };
    };
  };
}
