{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.indexyz.environment.efi;
in
{
  options = {
    indexyz.environment.efi = {
      enable = mkEnableOption "Basic grub efi config";
    };
  };
  config = mkIf cfg.enable {
    boot.loader = {
      grub = {
        enable = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
        device = "nodev";
      };
      efi.canTouchEfiVariables = false;
    };
  };
}
