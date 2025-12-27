{
  pkgs,
  config,
  lib,
  ...
}:

with lib;
let
  cfg = config.indexyz.services.wiretrustee-client;
in
{
  options = {
    indexyz.services.wiretrustee-client = {
      enable = mkEnableOption "Enable wiretrustee client service";
    };
  };

  config = mkIf cfg.enable {
    systemd.services.wiretrustee-client = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        Restart = "always";
        RestartSec = 30;
      };

      script = ''
        ${pkgs.wiretrustee}/bin/wiretrustee up
      '';
    };
  };
}
