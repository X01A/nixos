{ lib }:

with lib;

types.submodule ({
  options = {
    name = mkOption {
      type = types.str;
      example = "http";
      description = " Name of proxy";
    };

    server = mkOption {
      type = types.str;
      example = "server";
      description = "Http proxy server";
    };

    port = mkOption {
      type = types.int;
      example = "7890";
      description = "Http proxy port";
    };

    username = mkOption {
      type = with types; nullOr str;
      default = null;
    };

    password = mkOption {
      type = with types; nullOr str;
      default = null;
    };

    tls = mkOption {
      type = with types; nullOr bool;
      default = null;
    };

    skip-cert-verify = mkOption {
      type = with types; nullOr bool;
      default = null;
    };

    sni = mkOption {
      type = with types; nullOr str;
      default = null;
    };
  };
})

