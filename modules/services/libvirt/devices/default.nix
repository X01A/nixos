{ pkgs, config, ... }:
with builtins;
let
  lib = pkgs.lib;

  supportedDevices = {
    basic-io = ./basic-io.nix;
    bridge = ./bridge.nix;
    custom = ./custom.nix;
    iso = ./iso.nix;
    qcow2 = ./qcow2.nix;
    veth-pair = ./veth-pair.nix;
    tpm = ./tpm.nix;
  };

  devices = lib.attrsets.mapAttrs (n: v: import v { inherit pkgs config; }) supportedDevices;
in
{
  render = device: machineName: machine:
    if hasAttr device.type devices then devices.${device.type}.render device machineName machine
    else throw "Unsupported device ${device.type}. Supported types: ${toString (attrNames supportedDevices)}";
} // (lib.attrsets.mapAttrs (n: v: v.construct) devices)
