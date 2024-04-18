{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a8c17598aa4e0419cb6a4914688d00750eb5e3e0";
    sha256 = "sha256-gSmf0JF+qZEDnLTPTkVa0DLa+WRDqmzShzEvXBfEN+U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
