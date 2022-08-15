{ config, pkgs, lib, ... }:

{
  users.users.root.initialPassword = lib.mkDefault "toor";
  boot = {
    supportedFilesystems = [ "zfs" ];
    initrd.supportedFilesystems = [ "zfs" ];
    kernelParams = [ "console=tty0" "console=ttyS0,115200n8" ];
  };

  networking = {
    wireless.enable = false;

    hostId = "9a18f601";
  };

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;

  indexyz.services.ssh.enable = true;
  indexyz.environment.base.enable = true;

  documentation = {
    enable = true;
    man.enable = true;
  };
}
