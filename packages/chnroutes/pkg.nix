{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "117da2cb61616c2f3e6b572f407cd4fd474b99f0";
    sha256 = "sha256-3p21bFT6eyMaI4Ek/Nqj7E7zN4GLUCyg2RegPJq66QE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
