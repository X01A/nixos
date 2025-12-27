# Basic I/O devices

{ pkgs, ... }:
with builtins;
let
  lib = pkgs.lib;
in
{
  construct =
    {
      port ? null,
      password ? null,
    }:
    {
      type = "basic-io";
      config = { inherit port password; };
    };
  render =
    device: machineName: machine:
    let
      vncBase = "/run/hypervisor/vnc";
      vncSocket = "${vncBase}/${machineName}";
    in
    {
      deviceStanza = ''
        <input type="keyboard" bus="usb"/>
        <video>
          <model type='virtio'/>
        </video>
        ${lib.optionalString (device.config.port == null) ''
          <graphics type="vnc">
            <listen type="socket" socket="${vncSocket}"/>
          </graphics>
        ''}

        ${lib.optionalString (device.config.port != null) ''
          <graphics type='vnc'
            port='${toString device.config.port}'
            listen='0.0.0.0'
            ${lib.optionalString (device.config.password != null) "passwd='${device.config.password}'"} />
        ''}

      '';

      provisionScript = toString (
        pkgs.writeScript "vm-basic-io" ''
          ${pkgs.coreutils}/bin/mkdir -p ${vncBase}
        ''
      );
    };
}
