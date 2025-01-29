{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.services.frps;
  format = pkgs.formats.toml { };

  cfgFile = format.generate "config.toml" cfg.settings;
in
{
  options = {
    indexyz.services.frps = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };

      config = mkOption {
        type = format.type;
        default = { };
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.services.frps = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.frp}/bin/frps -c ${cfgFile}";
        Restart = "always";
        RestartSec = 30;
      };
    };
  };
}
