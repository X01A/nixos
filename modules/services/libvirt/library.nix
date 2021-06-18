{ lib, requireFile, fetchurl, runCommand, cdrkit, pkgs, ... }:

{
  cloud-config = { meta_data, user_data }: runCommand "cloud-config.iso"
    {
      inherit meta_data user_data;
    } ''
    echo "$user_data" > user-data
    echo "$meta_data" > meta-data
    ${cdrkit}/bin/genisoimage  -output $out -volid cidata -joliet -rock user-data meta-data
  '';

  isos = rec {
    archlinux = date: sha256: fetchurl {
      inherit sha256;
      url = "https://mirrors.edge.kernel.org/archlinux/iso/${date}/archlinux-${date}-x86_64.iso";
    };

    archlinux_latest = archlinux "2021.06.01" "0i82mr2l99j7alljvwz3p91w5yrk1ilpzvdbrj4la8kszcfzh8xx";

    netbootxyz = fetchurl {
      url = "https://boot.netboot.xyz/ipxe/netboot.xyz.iso";
      sha1 = "0sd133jzns97ah8ifyhbqqd4623mh04v2zy3vx2zmsyl943p4jxs";
    };

    windows = rec {
      x64_21h1_en_bussiness = requireFile {
        url = "https://files.rg-adguard.net/file/3afa4c53-bac6-f55c-a8cf-aab357784d75";
        name = "en_windows_10_business_editions_version_21h1_x64_dvd_ec5a76c1.iso";
        sha256 = "0fc1b94fa41fd15a32488f1360e347e49934ad731b495656a0a95658a74ad67f";
      };
    };

    # Yo dawg, I put NixOS in NixOS, so you can NixOS while you NixOS
    nixos = extraConfig:
      let
        eval = (import (pkgs.path + "/nixos/lib/eval-config.nix")) {
          system = "x86_64-linux";
          modules = [
            extraConfig

            (pkgs.path + "/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix")
            (pkgs.path + "/nixos/modules/installer/cd-dvd/channel.nix")
          ] ++ (import (pkgs.path + "/nixos/modules/module-list.nix"));
          specialArgs = {
            modulesPath = pkgs.path + "/nixos/modules";
          };
        };
        drv = eval.config.system.build.isoImage;
        name = lib.strings.getName drv;
        version = lib.strings.getVersion drv;
      in
      drv + "/iso/${name}-${version}";
  };
}
