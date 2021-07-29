{ pkgs, config, lib, ... }:

with lib;

{
  options = {
    indexyz.environment.acme = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };

      hosts = mkOption {
        default = [ ];
        type = with types; listOf hostOptions;
      };
    };
  };

  config = mkIf cfg.enable {
    security.acme = {
      acceptTerms = true;
      email = "acme@indexyz.me";
      preliminarySelfsigned = true;
    };
  };
}
