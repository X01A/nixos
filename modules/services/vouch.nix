{ pkgs, config, lib, ... }:

with lib;
let
  cfg = config.indexyz.services.vouch;

  resultJSON = pkgs.writeText "config.yml" (builtins.toJSON cfg.config);
in
{
  options = {
    indexyz.services.vouch = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };

      port = mkOption {
        default = 9090;
        type = types.int;
      };

      config = mkOption {
        default = { };
        type = types.attrs;
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.services.vouch = {
      description = "an SSO and OAuth / OIDC login solution for Nginx using the auth_request module";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];

      script = ''
        ${pkgs.vouch}/bin/vouch-proxy -config ${resultJSON} -port ${toString cfg.port}
      '';
    };
  };
}
