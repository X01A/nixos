{ config, pkgs, lib, ... }:

with lib;
let
  utils = import ./utils.nix { inherit pkgs config; };
  inherit (utils) managePort manageAddr;

  cfg = config.indexyz.services.clash;
  subscribeOptions = types.submodule (import ./subscribe.nix {
    inherit lib;
  });

  profileCommands = builtins.concatStringsSep "\n" (attrsets.mapAttrsToList
    (name: val:
      let
        fileName = "${name}.yaml";
        fileLocation = "${cfg.dataDir}/${fileName}";
        fileData = pkgs.writeText fileName val;
      in
      ''
        rm -f ${fileLocation}
        cp ${fileData} ${fileLocation}
        ${utils.updateConfigScript name false}
      '')
    cfg.profiles);
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

      profiles = mkOption {
        default = [ ];
        type = types.attrs;
      };
    };
  };


  imports = [
    ./subscribe-config.nix
  ];

  config = mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = (if cfg.allowLan then [
      # Clash Ports
      cfg.port
      (toInt managePort)
    ] else [ ]);

    systemd.services = {
      clash = {
        description = "Clash network proxy";
        wantedBy = [ "multi-user.target" ];
        after = [ "network.target" ];
        preStart = profileCommands;
        serviceConfig = {
          LimitNOFILE = "16777216";
          LimitNPROC = "infinity";
          LimitCORE = "infinity";
          TasksMax = "infinity";
          WorkingDirectory = cfg.dataDir;
          ExecStart = "${cfg.package}/bin/clash -d ${cfg.dataDir} -ext-ctl ${cfg.controller} -f ${cfg.config}.yaml ${optionalString (cfg.secret != null) ''--secret ${cfg.secret}''}";
      };
    };
  };
}
