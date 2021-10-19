# qcow2 provisioner

{ pkgs, config, ... }:
with builtins;
let
  lib = pkgs.lib;
  cfg = config.zhaofeng.services.hypervisor;
  tools = import ../tools {
    inherit pkgs config;
  };
in
{
  # QEMU qcow2 disk image
  construct =
    {
      # Block device
      block ? null
    , # Target device
      #
      # Example: vda
      dev ? null
    , # Target bus
      #
      # Example: virtio
      bus ? "virtio"
    , fromDisk ? null
    }:
    let
      compDev =
        if dev != null then dev
        else if bus == "virtio" then "vda"
        else throw "You must specify a target device (e.g., vda, sda) according to the target bus";
    in
    {
      type = "qcow2";
      config = {
        inherit name capacity bus block;
        dev = compDev;
      };
    };

  render = device: machineName: machine:
    {
      deviceStanza = ''
        <disk type='block' device='disk'>
          <driver name='qemu' type='raw'/>
          <source dev='${device.config.block}'/>
          <target dev="${device.config.dev}" bus="${device.config.bus}"/>
        </disk>
      '';

      provisionScript = "";
    };
}
