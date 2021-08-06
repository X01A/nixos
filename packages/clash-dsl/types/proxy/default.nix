{ lib }:

with lib;
let
  types = [
    "http"
  ];
in
genAttrs types (t: import (./. + "/${t}.nix") { inherit lib; })
