{ path, lib }:

diskSize: extraConfig:
let
  buildConfig = { lib, config, pkgs, ... }: {
    fileSystems."/" = {
      device = "/dev/disk/by-label/nixos";
      autoResize = true;
      fsType = "ext4";
    };

    boot.growPartition = true;
    boot.kernelParams = [ "console=ttyS0" ];
    boot.loader.grub.device = lib.mkDefault "/dev/vda";

    system.build.qcow = import "${toString path}/nixos/lib/make-disk-image.nix" {
      inherit lib config pkgs;
      inherit diskSize;
      format = "qcow2";
      copyChannel = false;
    };
  };

  eval = (import (path + "/nixos/lib/eval-config.nix")) {
    system = "x86_64-linux";
    modules = [
      extraConfig
      buildConfig
    ];
  };

  drv = eval.config.system.build.qcow;
  name = lib.strings.getName drv;
  version = lib.strings.getVersion drv;
in
drv
