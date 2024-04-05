{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3e0d2dbbcb23bf52e7bc8761a0ecadf5960a2708";
    sha256 = "sha256-l6zS2RWq03cLo9tFskoJe5BMH/1rLcM7LMOwVyD+W08=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
