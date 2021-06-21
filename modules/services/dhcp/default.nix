{ config, lib, ... }:


with lib;

let
  cfg = config.indexyz.services.dhcp;
  subnetOptions = types.submodule (import ./subnet-options.nix {
    inherit lib;
  });

  utils = import ./utils.nix {
    inherit lib;
  };

  configText = utils.buildConfig cfg;
in
{
  options = {
    indexyz.services.dhcp = {
      enable = mkOption {
        default = false;
        type = with types; bool;
      };

      subnets = mkOption {
        default = [ ];
        type = with types; listOf subnetOptions;
      };

      enableIpxe = mkOption {
        default = false;
        type = types.bool;
      };

      interfaces = mkOption {
        default = [ ];
        type = with types; listOf str;
      };
    };
  };

  config = mkIf cfg.enable {
    services.dhcpd4 = {
      enable = true;
      interfaces = cfg.interfaces;
      extraConfig = configText;
    };
  };
}
