{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-11-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "99b7ef18935da9c2763fcb28e81c75b63013011d";
    sha256 = "sha256-2ezvTujft1Sjo9/qP+oe7lzSzyLJOmMiutWPZ/Q7baY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
