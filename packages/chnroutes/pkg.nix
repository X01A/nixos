{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "85dcfb10cc04c16917bee6209fc431260d1653ec";
    sha256 = "sha256-HFQRjFRhQYD/KTGrugUxe+5d5VoA19qWG2wrFiXDlFY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
