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
      url = provider.url;
      type = provider.type;
      interval = provider.interval;
      path = provider.path;
    };
  };

  proxyGroup = types.submodule ({
    options = {
      name = mkOption {
        type = types.str;
      };

      type = mkOption {
        type = types.enum [ "select" ];
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
    };
  });

  buildProxyGroup = group: {
    name = group.name;
    type = group.type;
    proxies = group.proxies;
    use = group.use;
  };
in
{
  inherit proxyProvider buildProxyProvider proxyGroup buildProxyGroup;
}
