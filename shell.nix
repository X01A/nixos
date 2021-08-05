with import <nixpkgs> {};

let
  flake = import ./. {};
in mkShell {
  nativeBuildInputs = [
    fish nvfetcher
  ];
}
