{ config, pkgs, lib, utils, ... }:

with lib;
let
  cfg = config.indexyz.services.frpc;
  format = pkgs.formats.json { };
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
        Restart = "always";
        RestartSec = "10s";
        StateDirectory = "frpc";
        RuntimeDirectory = "frpc";
        RuntimeDirectoryPreserve = "frpc";
        WorkingDirectory = "/var/lib/frpc";
      };

      script = ''
        ${utils.genJqSecretsReplacementSnippet cfg.settings "/var/lib/frpc/config.json"}
        exec ${pkgs.frp}/bin/frpc -c /var/lib/frpc/config.json
      '';
    };
  };
}
