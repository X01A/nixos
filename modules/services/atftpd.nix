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
    };
  };

  config = mkIf cfg.enable {
    services.atftpd = {
      enable = true;
      root = pkgs.ipxe;
    };

    networking.firewall.allowedUDPPorts = [ 69 ];
  };
}
