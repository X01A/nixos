{
  config,
  lib,
  pkgs,
  ...
}:

with lib;
let
  cfg = config.indexyz.services.influxdb;
in
{
  options = {
    indexyz.services.influxdb = {
      enable = mkEnableOption "Enable influxdb version 2";

      dataDir = mkOption {
        default = "/var/lib/influxdb";
        type = types.str;
      };

      bindAddress = mkOption {
        type = types.str;
        default = ":8086";
        description = "Bind address for the REST HTTP API";
      };

      extraArgs = mkOption {
        type = types.str;
        default = "";
        description = "Extra args to run influxd";
        example = "--pprof-disabled";
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.services.influxdb = {
      description = "Scalable datastore for metrics, events, and real-time analytics";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];

      script = ''
        mkdir -p ${cfg.dataDir}

        ${pkgs.influxdb2}/bin/influxd --reporting-disabled \
          --bolt-path ${cfg.dataDir}/influxd.bolt --engine-path ${cfg.dataDir}/engine \
          --http-bind-address ${cfg.bindAddress} ${cfg.extraArgs}
      '';
    };
  };
}
