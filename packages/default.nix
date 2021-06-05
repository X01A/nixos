{ nixpkgs }:

with nixpkgs; {
  microsocks = callPackage ./microsocks { };
  transmission-web-control = callPackage ./transmission-web-control { };
}
