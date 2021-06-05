{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.services.frps;
  basicConfig = pkgs.writeText "frps.ini" ''
    [common]
    bind_port = ${toString cfg.port}
    authentication_method = token
    token = ${cfg.token}
    ${optionalString cfg.enableWeb ''
    vhost_http_port = ${toString cfg.httpPort}
    vhost_https_port = ${toString cfg.httpsPort}
    ''}
  '';
in
{
  options = {
    indexyz.services.frps = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };

      port = mkOption {
        default = 7000;
        type = types.int;
      };

      token = mkOption {
        default = "12345678";
        type = types.str;
      };

      enableWeb = mkOption {
        default = false;
        type = types.bool;
      };

      httpPort = mkOption {
        default = 80;
        type = types.int;
      };

      httpsPort = mkOption {
        default = 443;
        type = types.int;
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.services.frps = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.frp}/bin/frps -c ${basicConfig}";
        Restart = "always";
      };
    };

    networking.firewall.allowedTCPPorts = [ cfg.port ]
      # Enable web port
      ++ (if cfg.enableWeb then [
      cfg.httpPort
      cfg.httpsPort
    ] else [ ]);
  };
}
