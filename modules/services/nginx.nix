{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.services.nginx;

  cert = with pkgs; stdenv.mkDerivation rec {
    name = "fakecert";
    phases = "installPhase";
    buildInputs = [ openssl ];

    installPhase = ''
      mkdir -p $out/certs
      cd $out/certs
      openssl genrsa -out server.key 4096
      openssl req -new -x509 -days 3650 \
          -key server.key -out server.crt \
          -subj "/C=CN/ST=FakeCert/L=FakeCert/O=FakeCert/OU=FakeCert/CN=example.com"
    '';
  };
in
{
  options = {
    indexyz.services.nginx = {
      enable = mkEnableOption "Enable custom nginx conf";

      fakeHost = mkOption {
        default = true;
        type = types.bool;
      };
    };
  };

  config = mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = [ 80 443 ];

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
      "default.host" = {
        sslCertificate = "${cert}/certs/server.crt";
        sslCertificateKey = "${cert}/certs/server.key";

        default = true;

        locations."/.well-known/acme-challenge" = {
          root = "/var/lib/acme/acme-challenge";
        };

        locations."/" = {
          return = "444";
        };
      };
    };
  };
}
