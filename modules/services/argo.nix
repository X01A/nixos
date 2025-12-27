{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.indexyz.services.argo;

  ruleOptions = types.submodule ({
    options = {
      name = mkOption {
        type = types.str;
        description = "Cloudflare tunnel rule name";
      };

      targetHost = mkOption {
        type = types.str;
        example = "http://localhost:3000";
        description = "The web host that should forward to cloudflare";
      };

      hostname = mkOption {
        type = types.str;
        example = "youknonw.indexyz.me";
        description = "The hostname that cloudflare should use";
      };

      certFile = mkOption {
        type = types.str;
        example = "/run/secrets/CLOUDFLARE_CERT";
        description = ''
          Cloudflare auth cert and origin cret file.
          You can create it by `cloudflared login`
        '';
      };

      after = mkOption {
        default = "network.target";
        type = types.str;
        description = "Start cloudflared after";
        example = "nginx.service";
      };
    };
  });
in
{

  options = {
    indexyz.services.argo = {
      enable = mkEnableOption "Cloudflare Argo Tunnel";

      hosts = mkOption {
        type = with types; listOf ruleOptions;
        default = [ ];
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.services = builtins.listToAttrs (
      map (item: {
        name = "argo-tunnel-${item.name}";
        value = {
          wantedBy = [ "multi-user.target" ];
          after = [ item.after ];
          description = "${item.name} Argo Tunnel";
          serviceConfig = {
            Restart = "always";
          };

          script = ''
            ${pkgs.cloudflared}/bin/cloudflared tunnel \
              --origincert ${item.certFile} \
              --hostname ${item.hostname} \
              --url ${item.targetHost}
          '';
        };
      }) cfg.hosts
    );
  };
}
