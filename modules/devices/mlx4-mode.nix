{
  config,
  pkgs,
  lib,
  ...
}:

with lib;
let
  cfg = config.indexyz.devices.mlx4-mode;
in
{
  options = {
    indexyz.devices.mlx4-mode = {
      enable = mkEnableOption "Enable mlx4 mode switch";

      mode = mkOption {
        type = types.enum [
          "eth"
          "ib"
          "auto"
        ];
        default = "eth";
        description = "Network card mode";
      };
    };
  };

  config = mkIf cfg.enable {
    boot.initrd = {
      availableKernelModules = [
        "mlx4_core"
        "mlx4_en"
      ];
      postDeviceCommands = ''
        for pci_dev in /sys/bus/pci/devices/*/; do
          if [ -e $pci_dev/mlx4_port1 ]; then
            echo "${cfg.mode}" > $pci_dev/mlx4_port1;
            if [ -e $pci_dev/mlx4_port2 ]; then
              echo "${cfg.mode}" > $pci_dev/mlx4_port2
            fi
          fi
        done
      '';
    };
  };
}
