# Bridge

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
  # Host-side Bridge
  construct =
    {
      # Model
      model ? "virtio",
      # Host-side bridge
      dev,
      # MAC address
      #
      # Leave null to generate deterministic name-based
      # MAC address
      mac ? null,
      # Network
      #
      # Hint for other modules to assign guest IPs on this
      # interface.
      #
      # If null, it's set to the name of the guest.
      network ? null,
    }:
    {
      type = "bridge";
      config = {
        # null mac will be replaced in render
        inherit
          model
          dev
          mac
          network
          ;
      };
    };

  render =
    device: machineName: machine:
    let
      interfaceId = "${machineName}-${device.config.model}-${device.config.dev}";
      compMac =
        if device.config.mac != null then
          device.config.mac
        else
          tools.domainMac cfg.macNamespace interfaceId;
      compNetwork = if device.config.network != null then device.config.network else machineName;
    in
    {
      deviceStanza = ''
        <interface type="bridge">
          <source bridge="${device.config.dev}" />
          <model type="${device.config.model}" />
          <mac address="${compMac}" />
        </interface>
      '';

      provisionScript = "";

      network = {
        hostDev = device.config.dev;
        guestMac = compMac;
        network = compNetwork;
      };
    };
}
