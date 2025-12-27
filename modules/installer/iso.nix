{
  config,
  pkgs,
  lib,
  ...
}:

{
  users.users.root.initialPassword = lib.mkDefault "toor";

  networking = {
    wireless.enable = false;
    usePredictableInterfaceNames = false;
    networkmanager.enable = true;
  };

  hardware.enableRedistributableFirmware = true;
  hardware.cpu.intel.updateMicrocode = true;

  boot.supportedFilesystems = lib.mkForce [
    "btrfs"
    "reiserfs"
    "vfat"
    "f2fs"
    "xfs"
    "ntfs"
    "cifs"
    "ext4"
    "vfat"
  ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;

  indexyz.services.ssh.enable = true;
  indexyz.environment.base.enable = true;

  documentation = {
    enable = true;
    man.enable = true;
  };

  services.openssh.settings.PermitRootLogin = lib.mkForce "yes";
}
