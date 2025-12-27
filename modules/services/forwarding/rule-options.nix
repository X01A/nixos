{ lib, ... }:

with lib;
{
  options = {
    listen = mkOption {
      default = "0.0.0.0";
      type = types.str;
    };

    port = mkOption {
      type = types.int;
    };

    target = mkOption {
      type = types.str;
    };

    targetPort = mkOption {
      type = types.int;
    };

    type = mkOption {
      default = "all";
      type = types.enum [
        "tcp"
        "udp"
        "all"
      ];
    };
  };
}
