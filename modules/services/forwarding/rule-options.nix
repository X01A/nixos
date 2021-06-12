{ lib, ... }:

with lib;
{
  options = {
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
      default = "tcp";
      type = types.enum [ "tcp" "udp" ];
    };
  };
}
