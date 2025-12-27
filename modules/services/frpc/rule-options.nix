{ lib, ... }:

with lib;
{
  options = {
    name = mkOption {
      type = types.str;
    };

    port = mkOption {
      type = types.int;
    };

    host = mkOption {
      type = types.str;
      default = "127.0.0.1";
    };

    domain = mkOption {
      type = types.str;
    };

    remotePort = mkOption {
      type = types.int;
    };

    type = mkOption {
      default = "tcp";
      type = types.enum [
        "tcp"
        "udp"
        "http"
        "https"
      ];
    };

    acme = mkOption {
      default = false;
      type = types.bool;
    };
  };
}
