# Basic I/O devices

{ pkgs, ... }:
with builtins;
{
  construct =
    { port ? null }: {
      type = "basic-io";
      config = { inherit port; };
    };
  render = device: machineName: machine:
    let
      vncBase = "/run/hypervisor/vnc";
      vncSocket = "${vncBase}/${machineName}";
    in
    {
      deviceStanza = ''
        <input type="keyboard" bus="usb"/>
        <graphics type="vnc">
            <listen type="socket" socket="${vncSocket}"/>
        </graphics>
      '';

      provisionScript = toString (pkgs.writeScript "vm-basic-io" ''
        ${pkgs.coreutils}/bin/mkdir -p ${vncBase}
      '');
    };
}
