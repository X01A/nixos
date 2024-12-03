{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "02020eb474962c5f521d252f7f8046e152858752";
    sha256 = "sha256-H+3zMFW6S2x/I9QBmXVNMy5QsqPPhkbYY82bVqiZIdU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
