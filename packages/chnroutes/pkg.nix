{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "31edee41778f0a88f852a92f7e4d9adadd7524e9";
    sha256 = "sha256-3P6bWcUwYTu81/bAsdexPPjlXPt26AhYHoet6+6Safc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
