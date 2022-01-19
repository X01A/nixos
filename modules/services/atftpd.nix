{ pkgs, config, lib, ... }:

with lib;
let
  cfg = config.indexyz.services.atftpd;
in
{
  options = {
    indexyz.services.atftpd = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };

      pkg = mkOption {
        default = pkgs.ipxe;
        type = types.package;
        defaultText = "pkgs.ipxe";
      };
    };
  };

  config = mkIf cfg.enable {
    services.atftpd = {
      enable = true;
      root = cfg.pkg;
    };

    networking.firewall.allowedUDPPorts = [ 69 ];
  };
}
