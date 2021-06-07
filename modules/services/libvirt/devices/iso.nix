# Attach an ISO

{ pkgs, ... }:
with builtins;
let
  lib = pkgs.lib;

  tools = import ../tools {
    inherit pkgs;
  };
in
{
  # ISO
  construct =
    {
      # Path to ISO
      iso
    , # Target device
      #
      # Example: vdc
      dev ? null
    , # Target bus
      #
      # Example: virtio
      bus ? "scsi"
    ,
    }:
    let
      compDev =
        if dev != null then dev
        else if bus == "scsi" then "sdc"
        else throw "You must specify a target device (e.g., sda, hda) according to the target bus";
    in
    {
      type = "iso";
      config = {
        inherit bus iso;
        dev = compDev;
      };
    };

  render = device: machineName: machine: {
    deviceStanza = ''
      <disk type="file" device="cdrom">
        <driver name="qemu" type="raw" />
        <source file="${toString device.config.iso}"/>
        <target dev="${device.config.dev}" bus="${device.config.bus}" />
        <readonly/>
      </disk>
    '';

    provisionScript = "";
  };
}
