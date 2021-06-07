{ nixpkgs }:

with nixpkgs; {
  microsocks = callPackage ./microsocks { };
  transmission-web-control = callPackage ./transmission-web-control { };


  # Libvirt module

  # tools need to read global config
  libvirt-tools = import ../modules/services/libvirt/tools;
  libvirt-iso-library = callPackage ../modules/services/libvirt/library.nix {};
}
