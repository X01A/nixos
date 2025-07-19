{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "de1e7def13a13d372bd0b5724f91ced3ed6d6fe0";
    sha256 = "sha256-eolLFkbKDgU2QaFIQnNyYvj7bkalDE0oI0EPPvoVyZE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
