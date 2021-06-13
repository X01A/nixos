{ nixpkgs }:

with nixpkgs; {
  transmission-web-control = callPackage ./transmission-web-control { };
  vlmcsd = callPackage ./vlmcsd { };
  speedtest = callPackage ./speedtest { };

  # Chia Miner
  chia-plotter = callPackage ./chia-plotter { };
  hpool-chia-miner = callPackage ./hpool-chia-miner { };

  # Proxy things
  microsocks = callPackage ./microsocks { };
  leaf = callPackage ./leaf { };

  # Libvirt module

  # tools need to read global config
  libvirt-tools = import ../modules/services/libvirt/tools;
  libvirt-iso-library = callPackage ../modules/services/libvirt/library.nix { };
}
