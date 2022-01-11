{ config, pkgs, lib, ... }:

{
  users.users.root.initialPassword = lib.mkDefault "toor";
  boot = {
    supportedFilesystems = [ "zfs" ];
    initrd.supportedFilesystems = [ "zfs" ];
  };

  networking = {
    wireless.enable = false;

    hostId = "9a18f601";
  };


  indexyz.services.ssh.enable = true;
  indexyz.environment.base.enable = true;

  documentation = {
    enable = true;
    man.enable = true;
  };
}
