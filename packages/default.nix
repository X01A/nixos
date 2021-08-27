{ nixpkgs }:

with nixpkgs; let
  nvfetcherOut = callPackage ../sources.nix { };
  cloudreve-cli = callPackage (nvfetcherOut.cloudreve-cli.src) { };
  build-electron-appimage = callPackage ./build-electron-appimage { };
in
{
  inherit cloudreve-cli build-electron-appimage;

  transmission-web-control = callPackage ./transmission-web-control { };
  vlmcsd = callPackage ./vlmcsd { };
  speedtest = callPackage ./speedtest { };

  wgcf = callPackage ./wgcf {
    source = nvfetcherOut.wgcf;
  };

  yacd = callPackage ./yacd {
    source = nvfetcherOut.yacd;
  };

  # Chia Miner
  chia-plotter = callPackage ./chia-plotter {
    source = nvfetcherOut.chia-plotter;
  };
  hpool-chia-miner = callPackage ./hpool-chia-miner { };

  # Proxy things
  microsocks = callPackage ./microsocks {
    source = nvfetcherOut.microsocks;
  };
  leaf = callPackage ./leaf { };

  # Libvirt module

  # tools need to read global config
  libvirt-tools = import ../modules/services/libvirt/tools;
  libvirt-iso-library = callPackage ../modules/services/libvirt/library.nix { };
  build-vm-qcow = callPackage ./build-vm-qcow { };

  ksmbd-tools = callPackage ./ksmbd/tools.nix { };
  ksmbd-kernel = callPackage ./ksmbd/kernel.nix { };

  fetch-cloudreve = callPackage ./fetch-cloudreve {
    inherit cloudreve-cli;
  };

  # Clash
  clash-dsl = callPackage ./clash-dsl { };

  fcitx5-material-color = callPackage ./fcitx5-material-color {
    source = nvfetcherOut.fcitx5-material-color;
  };

  yesplaymusic = callPackage ./yesplaymusic {
    inherit build-electron-appimage;
    source = nvfetcherOut.yesplaymusic;
  };

  tifig = callPackage ./tifig {
    source = nvfetcherOut.tifig;
  };

  desktop-icons-ng = callPackage ./desktop-icons-ng {
    source = nvfetcherOut.desktop-icons-ng;
  };

  sunshine = callPackage ./sunshine {
    source = nvfetcherOut.sunshine;
  };

  cloudreve = callPackage ./cloudreve {
    source = nvfetcherOut.cloudreve;
  };

  openwhisk-cli = callPackage ./openwhisk-cli {
    source = nvfetcherOut.openwhisk-cli;
  };

  vpncloud = callPackage ./vpncloud {
    source = nvfetcherOut.vpncloud;
  };

  winbox = callPackage ./winbox {
    source = nvfetcherOut.winbox;
  };

  motrix = callPackage ./motrix {
    inherit build-electron-appimage;
    source = nvfetcherOut.motrix;
  };

  mmdb-ipip = callPackage ./mmdb-ipip {
    source = nvfetcherOut.mmdb-ipip;
  };

  onedev = callPackage ./onedev {
    source = nvfetcherOut.onedev;
  };

  drone-runner-exec = callPackage ./drone-runner-exec {
    source = nvfetcherOut.drone-runner-exec;
  };

  drone-runner-docker = callPackage ./drone-runner-docker {
    source = nvfetcherOut.drone-runner-docker;
  };

  nali = callPackage ./nali {
    source = nvfetcherOut.nali;
  };
}
