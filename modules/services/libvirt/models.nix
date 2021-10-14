# Definition of hypervisor resources
#
# Some of them map directly to libvirt XML elements,
# and some are specific to this module.

{ lib, ... }:
let
  types = lib.types;
  nullOrStr = description: default: lib.mkOption {
    inherit description default;
    type = types.nullOr types.str;
  };
  str = description: lib.mkOption {
    inherit description;
    type = types.str;
  };
in
rec {
  sizeType = types.submodule {
    options = {
      unit = lib.mkOption {
        description = "Unit";
        type = types.enum [
          #  SI   IEC
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
      };
      value = lib.mkOption {
        description = "Value";
        type = types.ints.unsigned;
      };
    };
  };

  deviceType = types.submodule {
    options = {
      type = lib.mkOption {
        description = "Type";
        type = types.str;
      };
      config = lib.mkOption {
        description = "Renderer-specific configurations";
        type = types.attrs;
      };
    };
  };

  # <interface type="ethernet">
  #
  # TODO: Generic interface declaration
  #
  # For my use-case, each VM has a veth pair to
  # the host that is not bridged. Routing is
  # configured elsewhere.
  ethernetInterfaceType = types.submodule {
    options = {
      model = lib.mkOption {
        description = "Model";
        type = types.str;
      };
      device = lib.mkOption {
        description = "Device name";
        type = types.str;
      };
    };
  };

  machineType = types.submodule {
    options = {
      title = nullOrStr "Human-readable name" null;
      description = nullOrStr "Description" null;

      arch = nullOrStr "Architecture" "x86_64";
      machine = nullOrStr "Machine type" "pc-q35-5.2";
      autoStart = lib.mkOption {
        description = "Auto-start domain";
        default = true;
        type = types.bool;
      };

      # FIXME: Not used right now
      firmware = lib.mkOption {
        description = "System firmware";
        default = "bios";
        type = types.enum [ "bios" "efi" ];
      };
      # TODO: Support more sophisticated topologies
      smp = lib.mkOption {
        description = "Number of vCores";
        default = 1;
        type = types.ints.unsigned;
      };
      memory = lib.mkOption {
        description = "Memory size";
        type = sizeType;
      };
      bootOrder = lib.mkOption {
        description = "Boot order";
        type = types.listOf (types.enum [
          "fd"
          "hd"
          "cdrom"
          "network"
        ]);
        default = [ "hd" "cdrom" ];
      };
      balloon = lib.mkOption {
        description = ''
          Enable machine mem balloon
        '';
        default = true;
        type = types.bool;
      };
      devices = lib.mkOption {
        description = ''
          Devices
          Use helper functions which emit renderer-specific
          values
        '';
        default = [ ];
        type = types.listOf deviceType;
      };
    };
  };
}
