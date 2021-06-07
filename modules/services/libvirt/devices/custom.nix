# A simple escape hatch to define arbitrary libvirt devices
#
# Configs contain two attributes:
# - deviceStanza: XML stanza to be inserted into <devices>
# - provisionScript: Optional provisionScript to be run before domain startup. Must be idempotent.
{ pkgs, ... }:
{
  construct = config: {
    inherit config;
    type = "custom";
  };
  render = device: machineName: machine: device.config;
}
