{ config, lib, pkgs, ... }:

let
  cfg = config.zhaofeng.services.hypervisor;
in
{
  config = lib.mkIf cfg.enable {
    systemd.services.libvirtd.path = with pkgs; [
      swtpm-mod
      gnutls
    ];
  };
}
