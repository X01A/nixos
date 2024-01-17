{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "486dd615a9dcae74f3559ab7ff09d2a9b00086af";
    sha256 = "sha256-WujntNajE9JQkT3SInDjvoHqGMnQGTSpoaGAFSagPZs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
