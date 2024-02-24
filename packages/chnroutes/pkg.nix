{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c44d98fa892a5fa0cdbce2943ae5dd91f9dca71c";
    sha256 = "sha256-S4XsN3GKs+PvvDuEWlBHWibWoK8pMSx+BLkjTDzQTDk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
