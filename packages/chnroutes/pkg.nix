{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f4f38dc52c8f26b12a75ecfd867686a11f5bc0bc";
    sha256 = "sha256-LG45C/HiL/f75dEzmLagj/I1iD7IQ2eLfp0SIef2bNA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
