{ nixpkgs }:

with nixpkgs; let
  nvfetcherOut = callPackage ../sources.nix { };
  cloudreve-cli = callPackage (nvfetcherOut.cloudreve-cli.src) { };
in
{
  inherit cloudreve-cli;

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
    source = nvfetcherOut.yesplaymusic;
  };

  tifig = callPackage ./tifig {
    source = nvfetcherOut.tifig;
  };

  desktop-icons-ng = callPackage ./desktop-icons-ng {
    source = nvfetcherOut.desktop-icons-ng;
  };

  parsec = callPackage ./parsec { };

  sunshine = callPackage ./sunshine {
    source = nvfetcherOut.sunshine;
  };

  cloudreve = callPackage ./cloudreve {
    source = nvfetcherOut.cloudreve;
  };
}
