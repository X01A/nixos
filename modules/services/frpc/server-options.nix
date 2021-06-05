{ lib, ... }:

with lib;
let
  ruleOptions = types.submodule (import ./rule-options.nix {
    inherit lib;
  });
in
{
  options = {
    name = mkOption {
      type = types.str;
      default = "default";
    };

    server = mkOption {
      type = types.str;
    };

    serverPort = mkOption {
      type = types.int;
      default = 7000;
    };

    token = mkOption {
      description = ''
        Frp token verify, used to auth in server and client
      '';
      type = types.str;
    };

    rules = mkOption {
      default = [ ];
      type = types.listOf ruleOptions;
    };
  };
}
