{ pkgs, config, lib, ... }:

with lib;
let
  cfg = config.indexyz.network.tailscale.cert;
  commonCfg = config.indexyz.network.tailscale;

  moduleEnable = commonCfg.enable && cfg.enable;
in
{
  options = {
    indexyz.network.tailscale.cert = {
      enable = mkEnableOption "Enable tailscale cert service";
      traefikDefaultCert = mkEnableOption "Use tailscale cert as traefik default cert";

      domain = mkOption {
        type = types.str;
        description = ''
          Tailscale cert base domain

          You can find it in https://login.tailscale.com/admin/dns
        '';
      };

      hostName = mkOption {
        type = types.str;
        default = config.networking.hostName;
        description = ''
          client node name in tailscale, usually is the hostName.
        '';
      };
    };
  };

  config = mkIf (moduleEnable) (mkMerge [
    {
      systemd.services.tailscale-cert = {
        after = [ "network.target" "network-online.target" "tailscaled.service" ];
        wants = [ "tailscaled.service" ];
        wantedBy = [ "multi-user.target" ];

        path = with pkgs; [ tailscale ];

        serviceConfig = {
          Type = "oneshot";
          UMask = 0022;
          StateDirectoryMode = 750;
          ProtectSystem = "strict";
          ReadWritePaths = [
            "/var/lib/tailscale-cert"
          ];
          PrivateTmp = true;
          WorkingDirectory = "/var/lib/tailscale-cert";
          NoNewPrivileges = true;
          PrivateDevices = true;
          ProtectClock = true;
          ProtectHome = true;
          ProtectHostname = true;
          StateDirectory = [ "tailscale-cert" ];
        };

        script = ''
          tailscale cert --cert-file cert.pem --key-file key.pem ${cfg.hostName}.${cfg.domain}
        '';
      };

      systemd.timers.tailscale-renew = {
        wantedBy = [ "timers.target" ];
        description = "Renew tailscale server cert";
        timerConfig = {
          OnCalendar = "weekly";
          Unit = "tailscale-cert.service";
          Persistent = "yes";
          RandomizedDelaySec = "24h";
        };
      };
    }

    (mkIf (config.services.traefik.enable && cfg.traefikDefaultCert) {

      systemd.services.traefik.serviceConfig.StateDirectory = [ "tailscale-cert" ];
      services.traefik.dynamicConfigOptions = {
        tls.certificates = [
          {
            certFile = "/var/lib/tailscale-cert/cert.pem";
            keyFile = "/var/lib/tailscale-cert/key.pem";
          }
        ];
      };
    })
  ]);
}
