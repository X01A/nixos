{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "61ec8d472ca9a584ce2ca0594ccd22c18816063c";
    sha256 = "sha256-+FJ0en3DbP/J4InWCfWGL1R2WPon+LOyftxrn2A02X0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
