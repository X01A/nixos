{ pkgs, config, lib, ... }:

with lib;
let
  cfg = config.indexyz.services.reader;
in
{
  options = {
    indexyz.services.reader = {
      enable = mkEnableOption "Enable reader server";

      java = mkOption {
        type = types.package;
        default = pkgs.jdk;
      };

      secure = mkOption {
        type = types.bool;
        default = false;
      };

      inviteCode = mkOption {
        type = types.str;
        default = "inviteCode";
      };

      secureKey = mkOption {
        type = types.str;
        default = "secureKey";
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.services.reader = {
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        PermissionsStartOnly = true;
        LimitNPROC = 512;
        LimitNOFILE = 1048576;
        ProtectHome = true;
        ProtectHostname = true;
        ProtectKernelLogs = true;
        RemoveIPC = true;
        RestrictNamespaces = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        StateDirectory = "reader";
        RuntimeDirectory = "reader";
        RuntimeDirectoryPreserve = "reader";
        WorkingDirectory = "/var/lib/reader";
        StateDirectoryMode = "0700";
        NoNewPrivileges = true;
        DynamicUser = true;
        Restart = "on-failure";
      };

      script = ''
        exec ${cfg.java}/bin/java -jar ${pkgs.reader} --reader.app.secure=${toString cfg.secure} \
          --reader.app.secureKey=${cfg.secureKey} --reader.app.inviteCode=${cfg.inviteCode}
      '';
    };
  };
}
