{ lib, requireFile, fetchurl, runCommand, cdrkit, pkgs, ... }:

let
  KEKCA = fetchurl {
    url = "https://www.microsoft.com/pkiops/certs/MicCorKEKCA2011_2011-06-24.crt";
    sha256 = "sha256-oRF/UWoyzvy6Py0azhCoeXL9a76P4NC5luCeZdgCpQM=";
  };
  PRODCA = fetchurl {
    url = "https://www.microsoft.com/pkiops/certs/MicWinProPCA2011_2011-10-19.crt";
    sha256 = "sha256-6OlfBzOlXoute+ChQT7iPFH86mSzyPpqeGk1/dzHGWE=";
  };
in
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
      secure_boot_key = toString (runCommand "secure-boot-key.iso" {
        inherit KEKCA PRODCA;
      } ''
        ${pkgs.dosfstools}/bin/mkfs.msdos -C $out 2880
        cp $KEKCA MicCorKEKCA2011_2011-06-24.crt
        cp $PRODCA MicWinProPCA2011_2011-10-19.crt
        ${pkgs.mtools}/bin/mcopy -psvm -i $out ./* ::
      '');

      virtio_driver = toString (fetchurl {
        url = "https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.185-2/virtio-win-0.1.185.iso";
        sha256 = "rys8yfp5Bd6l5Y0xUI11u6cXwrDVVTliZYpHrrycw4Y=";
      });

      x64_21h1_en_bussiness = toString (requireFile {
        url = "https://files.rg-adguard.net/file/3afa4c53-bac6-f55c-a8cf-aab357784d75";
        name = "en_windows_10_business_editions_version_21h1_x64_dvd_ec5a76c1.iso";
        sha256 = "0fc1b94fa41fd15a32488f1360e347e49934ad731b495656a0a95658a74ad67f";
      });

      x64_11_22000_194_zh_cn_enterprise = toString (requireFile {
        url = "https://files.rg-adguard.net/file/aaf7387a-97ce-0d3e-9332-079a403614fe";
        name = "Windows11_InsiderPreview_EnterpriseVL_x64_zh-cn__22000.iso";
        sha256 = "718cbc68bb218227c5bf6b7a4ed1765e8550cf106988afaf7e6b505c7584c6de";
      });
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
