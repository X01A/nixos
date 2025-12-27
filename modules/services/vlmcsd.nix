{
  config,
  lib,
  pkgs,
  options,
  ...
}:

with lib;
let
  cfg = config.indexyz.services.vlmcsd;
in
{
  options = {
    indexyz.services.vlmcsd = {
      enable = mkEnableOption "Start vlmcsd kms server";

      openFirewall = mkOption {
        default = true;
        type = types.bool;
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.services.vlmcsd = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      description = "Start vlmcsd server.";
      serviceConfig = {
        PermissionsStartOnly = true;
        Type = "simple";
        ExecStart = ''${pkgs.vlmcsd}/bin/vlmcsd -D -d -t 3 -e -v'';
      };
    };

    networking.firewall.allowedTCPPorts = mkIf cfg.openFirewall [ 1688 ];
  };
}
