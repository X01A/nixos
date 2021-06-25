{ lib }:

with lib;
let
  types = [
    # Domain based
    "DOMAIN"
    "DOMAIN-SUFFIX"
    "DOMAIN-KEYWORD"

    # IP Based
    "GEOIP"
    "IP-CIDR"
    "IP-CIDR6"
    "SRC-IP-CIDR"

    "SRC-PORT"
    "DST-PORT"

    "PROCESS-NAME"

    "MATCH"
  ];
in
genAttrs types (t: import (./. + "/${t}.nix") { inherit lib; })
