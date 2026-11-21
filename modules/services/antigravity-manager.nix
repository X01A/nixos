{ config
, lib
, pkgs
, ...
}:

with lib;
let
  cfg = config.indexyz.services.antigravity-manager;

  # systemd StateDirectory= only takes the name below /var/lib.
  stateDirName = baseNameOf cfg.dataDir;
in
{
  options = {
    indexyz.services.antigravity-manager = {
      enable = mkEnableOption "Antigravity Manager headless server (API proxy + web console)";

      package = mkOption {
        default = pkgs.antigravity-manager;
        defaultText = literalExpression "pkgs.antigravity-manager";
        type = types.package;
      };

      port = mkOption {
        default = 8045;
        type = types.port;
      };

      listenAddress = mkOption {
        default = "127.0.0.1";
        type = types.str;
        example = "0.0.0.0";
        description = ''
          Address the proxy binds to. Upstream treats anything other than
          `127.0.0.1` / `localhost` as "allow LAN access".
        '';
      };

      dataDir = mkOption {
        default = "/var/lib/antigravity-manager";
        type = types.str;
        description = ''
          Directory holding `gui_config.json`, the token databases and the
          account data. Must live directly below `/var/lib` so that it can be
          managed as a systemd `StateDirectory`.
        '';
      };

      webUI = mkOption {
        default = true;
        type = types.bool;
        description = ''
          Serve the bundled web console on the same port. Disable for a pure
          API proxy (`--no-web`).
        '';
      };

      apiKey = mkOption {
        default = null;
        type = types.nullOr types.str;
        description = ''
          API key used to authenticate AI protocol calls. When null upstream
          generates a random key and prints it to the journal.

          Note: this value ends up in the world-readable unit file in the nix
          store, prefer {option}`environmentFile`.
        '';
      };

      webPassword = mkOption {
        default = null;
        type = types.nullOr types.str;
        description = ''
          Password for the web console login. Falls back to {option}`apiKey`
          when null.

          Note: this value ends up in the world-readable unit file in the nix
          store, prefer {option}`environmentFile`.
        '';
      };

      maxBodySize = mkOption {
        default = null;
        type = types.nullOr types.int;
        example = 104857600;
        description = "Maximum accepted request body size in bytes (`ABV_MAX_BODY_SIZE`).";
      };

      environmentFile = mkOption {
        default = null;
        type = types.nullOr types.path;
        example = "/run/secrets/antigravity-manager.env";
        description = ''
          Extra environment file, read as root and only passed to the service.
          Use it for `API_KEY=...` / `WEB_PASSWORD=...` so secrets stay out of
          the nix store.
        '';
      };

      extraEnvironment = mkOption {
        default = { };
        type = types.attrsOf types.str;
        example = {
          RUST_LOG = "debug";
        };
        description = "Extra environment variables for the service.";
      };

      openFirewall = mkOption {
        default = false;
        type = types.bool;
      };
    };
  };

  config = mkIf cfg.enable {
    assertions = [
      {
        assertion = dirOf cfg.dataDir == "/var/lib";
        message = "indexyz.services.antigravity-manager.dataDir must live directly below /var/lib.";
      }
    ];

    users.users.antigravity-manager = {
      isSystemUser = true;
      group = "antigravity-manager";
      home = cfg.dataDir;
    };
    users.groups.antigravity-manager = { };

    networking.firewall.allowedTCPPorts = mkIf cfg.openFirewall [ cfg.port ];

    systemd.services.antigravity-manager = {
      description = "Antigravity Manager headless server";
      documentation = [ "https://github.com/lbjlaq/Antigravity-Manager" ];
      wantedBy = [ "multi-user.target" ];
      wants = [ "network-online.target" ];
      after = [ "network-online.target" ];

      # The headless binary resolves its data dir from ABV_DATA_DIR and still
      # falls back to ~/.antigravity_tools_location, so HOME has to be set.
      environment =
        {
          HOME = cfg.dataDir;
          ABV_DATA_DIR = cfg.dataDir;
          RUST_LOG = "info";
        }
        // optionalAttrs (cfg.apiKey != null) {
          API_KEY = cfg.apiKey;
        }
        // optionalAttrs (cfg.webPassword != null) {
          ABV_WEB_PASSWORD = cfg.webPassword;
        }
        // optionalAttrs (cfg.maxBodySize != null) {
          ABV_MAX_BODY_SIZE = toString cfg.maxBodySize;
        }
        // cfg.extraEnvironment;

      serviceConfig = {
        ExecStart = "${cfg.package}/bin/antigravity-server --port ${
          toString cfg.port
        } --host ${cfg.listenAddress}${optionalString (!cfg.webUI) " --no-web"}";
        User = "antigravity-manager";
        Group = "antigravity-manager";
        StateDirectory = stateDirName;
        StateDirectoryMode = "0700";
        WorkingDirectory = cfg.dataDir;
        EnvironmentFile = mkIf (cfg.environmentFile != null) cfg.environmentFile;

        Restart = "on-failure";
        RestartSec = 5;

        # sysinfo and reqwest need netlink / sockets, nothing else.
        RestrictAddressFamilies = [
          "AF_INET"
          "AF_INET6"
          "AF_UNIX"
          "AF_NETLINK"
        ];
        NoNewPrivileges = true;
        PrivateTmp = true;
        PrivateDevices = true;
        ProtectClock = true;
        ProtectHome = true;
        ProtectHostname = true;
        ProtectKernelLogs = true;
        ProtectKernelModules = true;
        ProtectKernelTunables = true;
        ProtectSystem = "strict";
        RestrictNamespaces = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        RemoveIPC = true;
        LockPersonality = true;
      };
    };
  };
}
