{ lib }:

with lib;

let
  inherit (builtins) toJSON;
  proxy = import ./proxy.nix { inherit lib; };
  recursiveMergeAttrs = listOfAttrsets: fold (attrset: acc: recursiveUpdate attrset acc) { } listOfAttrsets;

  profile = types.submodule {
    options = {
      port = mkOption {
        type = types.int;
        description = "Connect in port";
      };

      rules = mkOption {
        type = with types; listOf str;
        description = "Clash rules";
      };

      logLevel = mkOption {
        type = types.enum [ "silent" "info" "error" "warning" "debug" ];
        default = "info";
      };

      mode = mkOption {
        type = types.enum [ "rule" "global" "direct" ];
        default = "rule";
      };

      ipv6 = mkOption {
        type = types.bool;
        default = true;
      };

      allowLan = mkOption {
        type = types.bool;
        default = true;
      };

      bindAddress = mkOption {
        type = types.str;
        default = "*";
      };

      proxies = mkOption {
        type = with types; listOf attrs;
        default = [ ];
      };

      proxyProviders = mkOption {
        type = with types; listOf proxy.proxyProvider;
        default = [ ];
      };

      proxyGroups = mkOption {
        type = with types; listOf proxy.proxyGroup;
        default = [ ];
      };

      __toString = mkOption {
        readOnly = true;
        visible = false;
      };
    };

    config = {
      __toString = data: toJSON {
        mixin-port = data.port;
        log-level = data.logLevel;
        mode = data.mode;
        ipv6 = data.ipv6;
        allow-lan = data.allowLan;
        bind-address = data.bindAddress;
        proxy-providers = recursiveMergeAttrs (map proxy.buildProxyProvider data.proxyProviders);
        proxy-groups = map proxy.buildProxyGroup data.proxyGroups;

        proxies = data.proxies;

        rules = data.rules;
      };
    };
  };
in
{
  inherit profile;
}
