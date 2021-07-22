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
      # Name
      name ? "main"
    , # Path
      #
      # If null, determined from cfg.storagePath
      path ? null
    , # Capacity
      #
      # Has no effect (for now) if there's an
      # existing image
      capacity ? null
    , # Target device
      #
      # Example: vda
      dev ? null
    , # Target bus
      #
      # Example: virtio
      bus ? "virtio"
    ,
      fromDisk ? null
    }:
    let
      compDev =
        if dev != null then dev
        else if bus == "virtio" then "vda"
        else throw "You must specify a target device (e.g., vda, sda) according to the target bus";
      compPath =
        if path != null then path
        else "${cfg.storagePath}/%machineName%/${name}.qcow2";
    in
    {
      type = "qcow2";
      config = {
        inherit name capacity bus;
        dev = compDev;
        path = compPath;
      };
    };

  render = device: machineName: machine:
    let
      deviceName = device.config.name;
      #diskPath = "/var/lib/hypervisor/${machineName}/${deviceName}.qcow2";
      diskPath = replaceStrings [ "%machineName%" ] [ machineName ] device.config.path;
      capacity = tools.qemu-img.renderSize device.config.capacity;
    in
    {
      deviceStanza = ''
        <disk type="file">
          <driver name="qemu" type="qcow2" />
          <source file="${diskPath}"/>
          <target dev="${device.config.dev}" bus="${device.config.bus}" />
        </disk>
      '';

      # FIXME: Better way than toString
      provisionScript = toString (pkgs.writeScript "vm-${machineName}-qcow2-${deviceName}" ''
        #!${pkgs.runtimeShell} -e
        dir=$(${pkgs.coreutils}/bin/dirname ${diskPath})
        mkdir -p $dir

        if [ -f "${diskPath}" ]; then
          echo "Using existing qcow2 image at ${diskPath}"
        else
          ${optionalString (fromDisk != null) ''
            echo "Copy disk image from ${fromDisk}"
            cp ${fromDisk} ${diskPath}
          ''}

          ${optionalString (fromDisk == null) ''
            echo "Creating ${capacity} qcow2 image at ${diskPath}"
            ${pkgs.qemu}/bin/qemu-img create -f qcow2 ${diskPath} ${capacity}
          ''}
        fi
      '');
    };
}
