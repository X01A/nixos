{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "abf0345fe783d833b9c97bed22725b5a0a211d74";
    sha256 = "sha256-g+FaJMIKt05a7+5saG7pm1l2Ojoyw3T+sZWusMZnrB4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
