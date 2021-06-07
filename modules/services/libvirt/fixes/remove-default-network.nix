{ config, lib, ... }:

let
  cfg = config.zhaofeng.services.hypervisor;
in
{
  config = lib.mkIf cfg.enable {
    systemd.services.libvirtd-config.script = lib.mkAfter ''
      rm /var/lib/libvirt/qemu/networks/default.xml
    '';
  };
}
