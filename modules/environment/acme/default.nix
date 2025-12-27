{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.indexyz.environment.acme;
in
{
  options = {
    indexyz.environment.acme = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };
    };
  };

  config = mkIf cfg.enable {
    security.acme = {
      acceptTerms = true;
      defaults.email = "acme@indexyz.me";
    };
  };
}
