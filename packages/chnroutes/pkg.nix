{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "983643c68f6a0aa0d51d7d08ebce6ca2bf73a503";
    sha256 = "sha256-3fLpz7WKDdR5EXu/f9iNelW04rpv38709vHoIYDowHg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
