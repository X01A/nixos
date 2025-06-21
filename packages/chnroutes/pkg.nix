{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "dc1b0ece5ea002568a83718ef164d7dc4075767c";
    sha256 = "sha256-aOL5QGKPoXFR9Q9n/5fzxxwU2etkZTPL2miDDatbN8E=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
