{ lib, ... }:

with lib;
{
  options = {
    name = mkOption {
      type = types.str;
    };

    url = mkOption {
      type = types.str;
    };

    calendar = mkOption {
      type = types.str;
      default = "*-*-* 4:00:00";
    };
  };
}
