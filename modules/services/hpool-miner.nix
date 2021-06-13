{ pkgs, config, lib, ... }:

with lib;
let
  cfg = config.indexyz.services.hpool-miner;
  minerConfig = {
    apiKey = cfg.token;
    deviceId = "";
    cachePath = "";
    debug = "";
    log = {
      lv = "info";
      path = "./log";
      name = "miner.log";
    };
    scanPath = true;
    scanMinute = 1;
    token = "";
    minerName = cfg.name;
    path = cfg.path;
    extraParams = { };
    url = {
      info = "";
      submit = "";
    };
  };

  configData = pkgs.writeText "config.yaml" (builtins.toJSON minerConfig);
in
{
  options = {
    indexyz.services.hpool-miner = {
      enable = mkOption {
        default = false;
        type = types.bool;
      };

      path = mkOption {
        type = with types; listOf str;
      };

      name = mkOption {
        type = types.str;
      };

      token = mkOption {
        type = types.str;
      };

      dataDir = mkOption {
        default = "/var/lib/hpool-miner";
        type = types.str;
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.services.hpool-miner = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        Restart = "always";
        RestartSec = "10s";
      };
      script = ''
        mkdir -p ${cfg.dataDir}
        cd ${cfg.dataDir}
        cp ${configData} config.yaml
        ${pkgs.hpool-chia-miner}/bin/hpool-miner-chia
      '';
    };
  };
}
