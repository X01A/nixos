{ config, lib, pkgs, options, ... }:

with lib;
let
  cfg = config.services.cloudreve;
  cfgFile = pkgs.writeText "conf.ini" ''
    [CORS]
    AllowOrigins = *
    AllowMethods = OPTIONS,GET,POST
    AllowHeaders = *
    AllowCredentials = false
    [Thumbnail]
    MaxWidth = 400
    MaxHeight = 300
    FileSuffix = ._thumb
    [System]
    Mode = ${cfg.mode}
    Listen = :${toString cfg.port}
    ${optionalString (cfg.mode == "master") ''
    SessionSecret = 3vZxQR1Fgv6zJ5zNDQwJ0f3VnHQPrcLHZlXsh1NBT0cLO2OZsnZtjVIAQpVUDH43
    HashIDSalt = XhMmGuHMx5ls55O8ShkbYT65mRH5SjTBhqZ8BWZB6yBvR4WakR3Syqf6qJpDMjZK
    [Database]
    DBFile = ${cfg.dataDir}/cloudreve.db
    ''}
    ${optionalString (cfg.mode == "slave") ''
    [Slave]
    Secret = ${cfg.slaveSecret}
    ''}
  '';
in
{
  options = {
    services.cloudreve = {
      enable = mkOption {
        default = false;
        type = with types; bool;
        description = ''
          Start cloudreve server.
        '';
      };

      port = mkOption {
        default = 5212;
        type = types.int;
        description = ''
          Cloudreve listen port
        '';
      };

      dataDir = mkOption {
        type = types.path;
        default = "/var/lib/cloudreve";
        description = ''
          Directory to store Cloudreve database and other state/data files.
        '';
      };

      openFirewall = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Whether to open ports in the firewall for the server.
        '';
      };

      mode = mkOption {
        type = types.enum [ "master" "slave" ];
        default = "master";
        description = ''
          运行模式
        '';
      };

      slaveSecret = mkOption {
        type = types.str;
        description = ''
          从机端通信密钥, 当 Mode = slave 时需要
        '';
      };

      package = mkOption {
        default = pkgs.cloudreve;
        type = types.package;
      };

      proKey = mkOption {
        default = null;
        type = with types; nullOr str;
      };
    };
  };


  config = mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];

    systemd.services.cloudreve = {
      description = "Cloudreve Server Service";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        ExecStart = "${cfg.dataDir}/cloudreve -c ${cfg.dataDir}/conf.ini";
        Restart = "always";
      };

      preStart = ''
        if [[ ! -d ${cfg.dataDir} ]]; then
            mkdir -p ${cfg.dataDir}
        fi
        rm -f ${cfg.dataDir}/cloudreve
        cp ${cfg.package}/bin/cloudreve ${cfg.dataDir}/cloudreve
        ln -sf ${cfgFile} ${cfg.dataDir}/conf.ini
        ${optionalString (cfg.proKey != null) ''
            cat ${pkgs.writeText "key.bin" cfg.proKey} | base64 -d > ${cfg.dataDir}/key.bin
        ''}
      '';
    };

    networking.firewall = mkIf cfg.openFirewall {
      allowedTCPPorts = [ cfg.port ];
    };
  };
}
