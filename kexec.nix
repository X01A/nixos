{ config, pkgs, ... }:

{
  imports = [
    ./modules/all-modules.nix
  ];

  indexyz.services.ssh.enable = true;
  indexyz.environment.base.enable = true;

  networking = {
    useDHCP = false;
    useNetworkd = true;
  };

  systemd.network.networks.eth0 = {
    name = "eth0";
    DHCP = "yes";
  };
}
