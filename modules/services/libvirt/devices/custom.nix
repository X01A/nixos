# A simple escape hatch to define arbitrary libvirt devices
#
# Configs contain two attributes:
# - deviceStanza: XML stanza to be inserted into <devices>
# - provisionScript: Optional provisionScript to be run before domain startup. Must be idempotent.
{ pkgs, ... }:
{
  construct = { xml ? "" }: {
    config = {
      inherit xml;
    };
    type = "custom";
  };
  render = device: machineName: machine: {
    deviceStanza = device.config.xml;
    provisionScript = "";
  };
}
