{ lib, ... }:

with lib;
let
  hostOptions = types.submodule (import ./host-options.nix {
    inherit lib;
  });
in
{
  options = {
    ip = mkOption {
      type = types.str;
    };

    netmask = mkOption {
      type = types.str;
      default = "255.255.255.0";
    };

    rangeBegin = mkOption {
      type = types.str;
    };

    rangeEnd = mkOption {
      type = types.str;
    };

    dns = mkOption {
      default = null;
      type = with types; nullOr str;
    };

    router = mkOption {
      default = null;
      type = with types; nullOr str;
    };

    ipxeFile = mkOption {
      default = null;
      type = with types; nullOr str;
    };

    tftpServer = mkOption {
      default = null;
      type = with types; nullOr str;
    };

    interface = mkOption {
      default = null;
      type = with types; nullOr str;
    };

    hosts = mkOption {
      default = [ ];
      type = types.listOf hostOptions;
    };

    extraConfig = mkOption {
      default = "";
      type = types.str;
    };
  };
}
