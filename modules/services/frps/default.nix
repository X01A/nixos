{ config, pkgs, lib, utils, ... }:

with lib;
let
  cfg = config.indexyz.services.frps;
  format = pkgs.formats.json { };
in
{
  options = {
    indexyz.services.frps = {
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
    systemd.services.frps = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        Restart = "always";
        RestartSec = 30;
        StateDirectory = "frps";
        RuntimeDirectory = "frps";
        RuntimeDirectoryPreserve = "frps";
        WorkingDirectory = "/var/lib/frps";
      };

      script = ''
        ${utils.genJqSecretsReplacementSnippet cfg.settings "/var/lib/frps/config.json"}
        exec ${pkgs.frp}/bin/frps -c /var/lib/frps/config.json
      '';
    };
  };
}
