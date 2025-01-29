{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.services.frpc;
  format = pkgs.formats.toml { };

  cfgFile = format.generate "config.toml" cfg.settings;
in
{
  options = {
    indexyz.services.frpc = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };

      settings = mkOption {
        type = format.type;
        default = { };
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.services.frpc = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];

      startLimitIntervalSec = 0;
      serviceConfig = {
        ExecStart = "${pkgs.frp}/bin/frpc -c ${cfgFile}";
        Restart = "always";
        RestartSec = "10s";
      };
    };
  };
}
