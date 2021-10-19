# Attach an ISO

{ pkgs, ... }:
with builtins;

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

      compIso = toString iso;
    in
    {
      type = "iso";
      config = {
        inherit bus;
        iso = compIso;
        dev = compDev;
      };
    };

  render = device: machineName: machine: {
    deviceStanza = ''
      <disk type="file" device="cdrom">
        <driver name="qemu" type="raw" />
        <source file="${device.config.iso}"/>
        <target dev="${device.config.dev}" bus="${device.config.bus}" />
        <readonly/>
      </disk>
    '';

    provisionScript = "";
  };
}
