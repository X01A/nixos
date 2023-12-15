{ lib }:

with lib;
let
  proxyProvider = types.submodule ({
    options = {
      name = mkOption {
        type = types.str;
      };

      url = mkOption {
        type = types.str;
      };

      path = mkOption {
        type = types.str;
      };

      type = mkOption {
        type = types.enum [ "http" ];
        default = "http";
      };

      interval = mkOption {
        type = types.int;
        default = 86400;
      };
    };
  });

  buildProxyProvider = provider: {
    "${provider.name}" = {
      inherit (provider) url type interval path;
    };
  };

  proxyGroup = types.submodule ({
    options = {
      name = mkOption {
        type = types.str;
      };

      type = mkOption {
        type = types.enum [ "select" "relay" "url-test" "fallback" "load-balance" ];
        default = "select";
      };

      proxies = mkOption {
        type = with types; listOf str;
        default = [ ];
      };

      use = mkOption {
        type = with types; listOf str;
        default = [ ];
      };

      url = mkOption {
        type = with types; nullOr str;
        default = null;
      };

      interval = mkOption {
        type = with types; nullOr int;
        default = null;
      };

      interface-name = mkOption {
        type = types.str;
        default = "";
      };

      routing-mark = mkOption {
        type = types.int;
        default = 0;
      };
    };
  });

  buildProxyGroup = group: {
    inherit (group) name type proxies use url interval interface-name routing-mark;
  };
in
{
  inherit proxyProvider buildProxyProvider proxyGroup buildProxyGroup;
}
