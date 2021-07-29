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

      configDir = mkOption {
        default = "/var/lib/vouch";
        type = types.str;
      };

      config = mkOption {
        default = { };
        type = types.attrs;
      };
    };
  };

  config = mkIf cfg.enable {
    system.activationScripts.vouch = ''
      mkdir -p ${cfg.configDir}
      cp ${resultJSON} ${cfg.configDir}/config.yml
    '';

    virtualisation.oci-containers.containers.vouch = {
      image = "voucher/vouch-proxy";
      ports = [
        "${toString cfg.port}:9090"
      ];
      volumes = [
        "${cfg.configDir}:/config/"
      ];
    };
  };
}
