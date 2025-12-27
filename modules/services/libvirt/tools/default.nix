{ pkgs, config, ... }:
let
  lib = pkgs.lib;
  cfg = config.zhaofeng.services.hypervisor;
in
rec {
  devices = import ../devices {
    inherit pkgs config;
  };
  renderedMachines = lib.attrsets.mapAttrs (
    name: val:
    val
    // {
      renderedDevices = builtins.map (d: devices.render d name val) val.devices;
      uuid = domainUuid cfg.domainNamespace name;
    }
  ) cfg.machines;

  qemu-img = import ./qemu-img.nix { inherit pkgs; };
  zfs = import ./zfs.nix { inherit pkgs; };

  domainUuid =
    namespace: name:
    builtins.readFile (
      pkgs.runCommandLocal "vm-${name}-uuid" { } ''
        ${pkgs.libossp_uuid}/bin/uuid -v5 ${namespace} ${lib.escapeShellArg name} | tr -d '\n' > $out
      ''
    );

  # FIXME: Extremely ugly abuse of UUID to generate hex strings...
  domainMac =
    namespace: identifier:
    builtins.readFile (
      pkgs.runCommandLocal "vm-${identifier}-mac" { } ''
        ${pkgs.libossp_uuid}/bin/uuid -v5 ${namespace} ${lib.escapeShellArg identifier} | tr -d '-' | sed -r 's/(.{2})/\1:/g' | cut -c1-17 | sed -r 's/./2/2' | tr -d '\n' > $out
      ''
    );

  units =
    let
      mkUnitFunction = unit: value: {
        inherit unit value;
      };
      units = [
        "MB"
        "M"
        "MiB"
        "GB"
        "G"
        "GiB"
        "TB"
        "T"
        "TiB"
      ];
    in
    builtins.listToAttrs (
      map (unit: {
        name = unit;
        value = mkUnitFunction unit;
      }) units
    );
}
