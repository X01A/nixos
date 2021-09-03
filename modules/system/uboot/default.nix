{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.indexyz.boot.loader.uboot;

  ubootBootloaderBuilder = pkgs.substituteAll {
    src = ./bootloader.sh;
    isExecutable = true;
    inherit (pkgs) bash;
    path = with pkgs; [ coreutils ubootTools ];
  };
in
{
  options = {
    indexyz.boot.loader.uboot = {
      enable = mkOption {
        default = false;
        type = types.bool;
      };
    };
  };

  config = mkIf cfg.enable {
    system.build.installBootLoader = ubootBootloaderBuilder;
    system.build.loader.id = "indexyz-uboot";
    system.boot.loader.kernelFile = pkgs.stdenv.hostPlatform.linux-kernel.target;
  };
}
