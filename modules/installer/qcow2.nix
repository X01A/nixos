{
  modulesPath,
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  users.users.root.initialPassword = lib.mkDefault "toor";

  networking = {
    wireless.enable = false;
    useNetworkd = true;
    useDHCP = true;
    usePredictableInterfaceNames = false;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  indexyz.services.ssh.enable = true;
  indexyz.environment.base.enable = true;
  indexyz.environment.efi.enable = true;
  services.qemuGuest.enable = true;

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
      autoResize = true;
    };

    "/boot" = {
      device = "/dev/disk/by-label/ESP";
      fsType = "vfat";
    };
  };

  boot.growPartition = true;

  system.build.qcow = import "${toString modulesPath}/../lib/make-disk-image.nix" {
    inherit lib config pkgs;
    diskSize = 4096;
    format = "qcow2";
    partitionTableType = "efi";
    copyChannel = false;
  };
}
