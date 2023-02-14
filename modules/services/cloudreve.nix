{ config, lib, pkgs, options, ... }:

with lib;
let
  cfg = config.services.cloudreve;
  toml = pkgs.formats.toml { };
  configFile = toml.generate "config.conf" cfg.settings;
in
{
  options = {
    services.cloudreve = {
      enable = mkEnableOption "Enable cloudreve";

      settings = mkOption {
        default = 5212;
        type = types.attrs;
      };

      package = mkOption {
        default = pkgs.cloudreve;
        type = types.package;
        defaultText = "pkgs.cloudreve";
      };
    };
  };


  config = mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];

    systemd.services.cloudreve = {
      description = "Self-hosted file management and sharing system, supports multiple storage providers";
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
        StateDirectory = "cloudreve";
        RuntimeDirectory = "cloudreve";
        RuntimeDirectoryPreserve = "cloudreve";
        WorkingDirectory = "/var/lib/cloudreve";
        StateDirectoryMode = "0700";
        CapabilityBoundingSet = "cap_net_bind_service";
        AmbientCapabilities = "cap_net_bind_service";
        NoNewPrivileges = true;
        DynamicUser = true;
        Restart = "on-failure";
      };

      script = ''
        exec ${pkgs.cloudreve-pro}/bin/cloudreve -c ${configFile}
      '';
    };
  };
}
