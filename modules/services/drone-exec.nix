{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.indexyz.services.drone-exec;

  configEnvFile = pkgs.writeText "drone.env" (''
    DRONE_RPC_PROTO=${cfg.serverProto}
    DRONE_RPC_HOST=${cfg.serverHost}
  '' + (builtins.concatStringsSep "\n" (attrsets.mapAttrsToList
    (name: val: "${name}=${val}")
    cfg.extraSettings)));
in
{
  options = {
    indexyz.services.drone-exec = {
      enable = mkOption {
        default = false;
        type = with types; bool;
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
        default = "/var/lib/drone-runner-exec";
        description = "Data store location";
      };

      extraSettings = mkOption {
        type = types.attrs;
        default = { };
        description = ''
          Extra settings, see also: https://docs.drone.io/runner/docker/configuration/reference/

          Example:
          {
            DRONE_RUNNER_LABELS = "os:nixos,arch:amd64";
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
    systemd.services.drone-exec-runner = {
      description = "Drone pipeline runner that executes builds directly on the host machine";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      path = with pkgs; [ git ];

      preStart = ''
        mkdir -p ${cfg.workDir}
        cat ${configEnvFile} > ${cfg.workDir}/conf.env
        echo "" >> ${cfg.workDir}/conf.env

        ${optionalString (cfg.secretEnvFile != null) ''
          cat ${cfg.secretEnvFile} > ${cfg.workDir}/conf.env
          echo "" >> ${cfg.workDir}/conf.env
        ''}

        cat ${cfg.rpcSecretFile} | ${pkgs.gawk}/bin/gawk '{print "DRONE_RPC_SECRET="$0}' >> ${cfg.workDir}/conf.env
      '';

      script = ''
        ${pkgs.drone-runner-exec}/bin/drone-runner-exec daemon ${cfg.workDir}/conf.env
      '';
    };
  };
}
