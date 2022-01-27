{ config, lib, pkgs, ... }:

with lib;

let
  recursiveMergeAttrs = listOfAttrsets: fold (attrset: acc: recursiveUpdate attrset acc) { } listOfAttrsets;
  cfg = config.indexyz.services.pufferpanel;

  defaultConfig = {
    logs = "${cfg.dataDir}/logs";
    panel = {
      database = {
        dialect = "sqlite3";
        url = "file:${cfg.dataDir}/database.db?cache=shared";
      };

      web = { files = "${pkgs.pufferpanel}/assets/www"; };
      daemon = {
        data = {
          cache = "${cfg.dataDir}/cache";
          servers = "${cfg.dataDir}/servers";
        };
      };
    };
  };

  configFile = pkgs.writeText "config.json" (builtins.toJSON (recursiveMergeAttrs [ defaultConfig cfg.extraConfig ]));
in
{
  options = {
    indexyz.services.pufferpanel = {
      enable = mkEnableOption "Enable pufferpanel";

      dataDir = mkOption {
        type = types.str;
        default = "/var/lib/pufferpanel";
        description = "Data store location";
      };

      openFirewall = mkOption {
        type = types.bool;
        default = false;
      };

      withPkgs = mkOption {
        type = with types; listOf package;
        default = [ ];
        description = "Extra package exist in runner path";
      };

      extraConfig = mkOption {
        type = (pkgs.formats.json { }).type;
        description = ''
          JSON config data needed for PufferPanel
          see also: https://github.com/PufferPanel/PufferPanel/blob/master/config/config.go
        '';
        default = { };
      };
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      pufferpanel
    ];

    users.users.pufferpanel = {
      description = "PufferPanel service user";
      home = cfg.dataDir;
      createHome = true;
      isSystemUser = true;
      group = "pufferpanel";
    };

    users.groups.pufferpanel = { };

    systemd.services.pufferpanel = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      path = cfg.withPkgs;

      description = "PufferPanel is an open source game server management panel";

      script = ''
        rm -rf ${cfg.dataDir}/email
        cp --no-preserve=mode,ownership -r ${pkgs.pufferpanel}/assets/email ${cfg.dataDir}/email
        cp -f ${configFile} ${cfg.dataDir}/config.json
        exec ${pkgs.pufferpanel}/bin/pufferpanel run
      '';

      serviceConfig = {
        PermissionsStartOnly = true;
        Type = "simple";
        User = "pufferpanel";
        WorkingDirectory = cfg.dataDir;
        ExecPreStartPre = "mkdir -p ${cfg.dataDir}";
        ExecStop = "${pkgs.pufferpanel}/bin/pufferpanel shutdown --pid $MAINPID";
        TimeoutStopSec = "5m";
        SendSIGKILL = "no";
      };
    };

    networking.firewall = mkIf cfg.openFirewall {
      allowedTCPPorts = [ 8080 5657 ];
    };
  };
}
