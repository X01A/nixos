{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.indexyz.services.teleport-agent;
in
{
  options = {
    indexyz.services.teleport-agent = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };

      token = mkOption {
        type = types.str;
      };

      authServer = mkOption {
        type = types.str;
      };

      extraOptions = mkOption {
        type = types.str;
        default = "";
      };

      insecure = mkOption {
        type = types.bool;
        default = false;
      };

      caPin = mkOption {
        type = with types; nullOr str;
        default = null;
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.services.teleport-join = {
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];

      script = ''
        ${pkgs.teleport}/bin/teleport start --roles=node \
            --token=${cfg.token} ${optionalString cfg.insecure "--insecure"} \
            --auth-server=${cfg.authServer} ${
              optionalString (cfg.caPin != null) "--ca-pin=${cfg.caPin}"
            } ${cfg.extraOptions}
      '';
    };
    networking.firewall.allowedTCPPorts = [ 3022 ];
  };
}
