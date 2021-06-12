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

  configText = utils.buildConfig cfg.subnets;
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
