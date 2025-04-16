{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "5c6edff13e8ecbdd75df4b2671aace10f8c70603";
    sha256 = "sha256-umeSHG0rIYFx4als0MLhl306cTxW+GsbrnTzRTWVPfk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
