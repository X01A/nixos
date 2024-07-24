{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "596d988940b97a87645a14d018d517327174b2ab";
    sha256 = "sha256-pfltnaKyd0+kkawCB8rhPlEDXB0fEXZfdsHlSeWpZ/A=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
