{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "10a67013f5bad5b1469e9e6050ef033eb6760fc8";
    sha256 = "sha256-1NYY/r6ZGmyhD/IJQ/RnhwWOFibDMNjMAVdajVFKOZk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
