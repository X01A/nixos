{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.services.prometheus;
in
{
  options = {
    indexyz.services.prometheus = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };

      nodeName = mkOption {
        type = types.str;
      };

      remoteWrite = mkOption {
        type = types.str;
        description = "Url for protomethus remote write";
      };
    };
  };

  config = mkIf cfg.enable {
    services.prometheus.exporters.node = {
      enable = true;
      enabledCollectors = [
        "logind"
        "systemd"
      ];

      disabledCollectors = [
        "textfile"
      ];
    };

    services.prometheus = {
      enable = true;
      scrapeConfigs = [{
        job_name = "node";
        scrape_interval = "10s";
        static_configs = [{
          targets = [
            "localhost:9100"
          ];
          labels = {
            alias = cfg.nodeName;
          };
        }];
      }];

      remoteWrite = [{
        url = cfg.remoteWrite;
      }];
    };
  };
}
