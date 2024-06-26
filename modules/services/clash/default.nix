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

      openFirewall = mkOption {
        default = true;
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
          default = pkgs.yacd-meta;
          defaultText = "pkgs.yacd-meta";
        };
      };

      ui = mkOption {
        type = types.package;
        default = pkgs.yacd;
        defaultText = "pkgs.yacd";
      };

      dns = mkOption {
        default = "";
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
    networking.firewall.allowedTCPPorts = mkIf cfg.openFirewall (if cfg.allowLan then [
      # Clash Ports
      cfg.port
      (toInt managePort)
    ] else [ ]);

    networking.firewall.allowedUDPPorts = mkIf cfg.openFirewall (if cfg.allowLan then [
      cfg.port
    ] else [ ]);


    systemd.services = {
      clash = {
        description = "Clash network proxy";
        wantedBy = [ "multi-user.target" ];
        after = [ "network.target" ];
        script = ''
          ${profileCommands}
          exec ${lib.getExe cfg.package} -d ${dataDir} \
            -ext-ctl ${cfg.controller} -ext-ui ${cfg.ui} \
            -f ${cfg.config}.yaml ${optionalString (cfg.secret != null) ''--secret ${cfg.secret}''}
        '';
        startLimitIntervalSec = 0;

        serviceConfig = {
          LimitNOFILE = "16777216";
          LimitNPROC = "infinity";
          LimitCORE = "infinity";
          TasksMax = "infinity";

          Restart = "always";

          StateDirectory = "clash";
          RuntimeDirectory = "clash";
          RuntimeDirectoryPreserve = "yes";
          CapabilityBoundingSet = [
            "CAP_NET_RAW"
            "CAP_NET_ADMIN"
            "CAP_NET_BIND_SERVICE"
          ];

          AmbientCapabilities = [
            "CAP_NET_RAW"
            "CAP_NET_ADMIN"
            "CAP_NET_BIND_SERVICE"
          ];

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
