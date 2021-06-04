{ nixpkgs }:

with nixpkgs; {
  microsocks = callPackage ./microsocks { };
}
