{ config, pkgs, lib, ... }:

with lib;
let
  dataDir = "/var/lib/clash";
  utils = import ./utils.nix { inherit pkgs config; };
  inherit (utils) managePort manageAddr;

  cfg = config.indexyz.services.clash;
  subscribeOptions = types.submodule (import ./subscribe.nix {
    inherit lib;
  });

  profileCommands = ''
    ${lib.optionalString (cfg.mmdb.enable) ''
      rm -f ${dataDir}/Country.mmdb
      ln -s ${cfg.mmdb.pkg} ${dataDir}/Country.mmdb
    ''}

  '' + builtins.concatStringsSep "\n" (attrsets.mapAttrsToList
    (name: val:
      let
        fileName = "${name}.yaml";
        fileLocation = "${dataDir}/${fileName}";
        fileData = pkgs.writeText fileName val;
      in
      ''
        rm -f ${fileLocation}
        cat ${fileData} > ${fileLocation}
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
        defaultText = "pkgs.clash";
      };

      secret = mkOption {
        default = null;
        type = with types; nullOr str;
      };

      mmdb = {
        enable = mkEnableOption "Enable MMDB Replacement";

        pkg = mkOption {
          type = types.package;
          default = pkgs.mmdb-ipip;
          defaultText = "pkgs.mmdb-ipip";
        };
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

    networking.firewall.allowedUDPPorts = (if cfg.allowLan then [
      cfg.port
    ] else [ ]);


    systemd.services = {
      clash = {
        description = "Clash network proxy";
        wantedBy = [ "multi-user.target" ];
        after = [ "network.target" ];
        script = ''
          ${profileCommands}
          exec ${cfg.package}/bin/clash -d ${dataDir} -ext-ctl ${cfg.controller} -f ${cfg.config}.yaml ${optionalString (cfg.secret != null) ''--secret ${cfg.secret}''}
        '';

        serviceConfig = {
          LimitNOFILE = "16777216";
          LimitNPROC = "infinity";
          LimitCORE = "infinity";
          TasksMax = "infinity";
          StateDirectory = "clash";
          RuntimeDirectory = "clash";
          RuntimeDirectoryPreserve = "yes";
          NoNewPrivileges = true;
          DynamicUser = true;
          ProtectHome = true;
          ProtectHostname = true;
          ProtectKernelLogs = true;
          RemoveIPC = true;
          RestrictNamespaces = true;
          RestrictRealtime = true;
          RestrictSUIDSGID = true;
          WorkingDirectory = dataDir;
        };
      };
    };
  };
}
