{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.services.clash;
  subscribeOptions = types.submodule (import ./subscribe.nix {
    inherit lib;
  });
in
{
  options = {
    indexyz.services.clash = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };

      controller = mkOption {
        default = "127.0.0.1:5890";
        type = types.str;
      };

      subscribe = mkOption {
        default = [ ];
        type = types.listOf subscribeOptions;
      };

      dataDir = mkOption {
        default = "/var/lib/clash";
        type = types.str;
      };

      allowLan = mkOption {
        default = false;
        type = types.bool;
      };

      port = mkOption {
        default = 7890;
        type = types.int;
      };

      config = mkOption {
        default = "config";
        type = types.str;
      };

      package = mkOption {
        default = pkgs.clash;
        type = types.package;
      };

      secret = mkOption {
        default = null;
        type = with types; nullOr str;
      };

      dns = mkOption {
        default = "1.1.1.1";
        type = types.str;
      };
    };
  };

  imports = [
    ./subscribe-config.nix
  ];

  config = mkIf cfg.enable {
    users.users.clash = {
      isSystemUser = true;
      name = "clash";
      home = cfg.dataDir;
      description = "Clash proxy user";
      group = "clash";
      createHome = true;
    };

    users.groups.clash = { };

    networking.firewall.allowedTCPPorts = (if cfg.allowLan then [
      # Clash Ports
      cfg.port
    ] else [ ]);

    systemd.services = {
      clash = {
        description = "Clash network proxy";
        wantedBy = [ "multi-user.target" ];
        after = [ "network.target" ];

        serviceConfig = {
          User = "clash";
          Group = "clash";
          WorkingDirectory = cfg.dataDir;
          ExecStart = "${cfg.package}/bin/clash -d ${cfg.dataDir} -ext-ctl ${cfg.controller} -f ${cfg.config}.yaml ${optionalString (cfg.secret != null) ''--secret ${cfg.secret}''}";
        };
      };
    };
  };
}
