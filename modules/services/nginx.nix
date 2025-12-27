{
  config,
  pkgs,
  lib,
  ...
}:

with lib;
let
  cfg = config.indexyz.services.nginx;

  mkListenConfig = addr: {
    inherit addr;
    port = 443;
    ssl = true;
    extraParameters = [
      "default"
      "fastopen=3"
      "reuseport"
    ];
  };
in
{
  options = {
    indexyz.services.nginx = {
      enable = mkEnableOption "Enable custom nginx conf";
      openFirewall = mkOption {
        default = true;
        type = types.bool;
      };

      fakeHost = mkOption {
        default = true;
        type = types.bool;
      };
    };
  };

  config = mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = mkIf cfg.openFirewall [
      80
      443
    ];

    services.nginx = {
      enable = true;
      statusPage = true;
      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;

      eventsConfig = ''
        worker_connections 20000;
      '';
    };

    services.nginx.virtualHosts = mkIf cfg.fakeHost {
      "_" = {
        extraConfig = ''
          ssl_protocols TLSv1.2 TLSv1.3;
          ssl_session_timeout 10m;
          ssl_session_cache builtin:1000 shared:SSL:10m;
          ssl_reject_handshake on;

          return 444;
        '';

        default = true;

        listen = [
          (mkListenConfig "0.0.0.0")
          (mkListenConfig "[::]")
        ];
      };
    };
  };
}
