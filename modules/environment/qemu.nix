{
  config,
  pkgs,
  lib,
  ...
}:

with lib;
let
  cfg = config.indexyz.environment.qemu;
in
{
  options = {
    indexyz.environment.qemu = {
      enable = mkEnableOption "Qemu Environment";
    };
  };
  config = mkIf cfg.enable {
    services.qemuGuest.enable = true;
    boot.growPartition = true;
  };
}
