{ lib, ... }:

with lib;
{
  options = {
    name = mkOption {
      type = types.str;
    };

    mac = mkOption {
      type = types.str;
    };

    address = mkOption {
      default = null;
      type = with types; nullOr str;
    };

    router = mkOption {
      default = null;
      type = with types; nullOr str;
    };

    dns = mkOption {
      default = null;
      type = with types; nullOr str;
    };

    extraOptions = mkOption {
      default = null;
      type = with types; nullOr str;
    };
  };
}
