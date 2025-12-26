{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "71861745d5632e23da2198c1173668a3c01eeb38";
    sha256 = "sha256-ubmHHA+3T9XL2w/aLdhjeJKGwmTJ905X4aH7lAl3dWA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
