{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "cebf385c1111b1b2699cf62bbd18809f1666e9b6";
    sha256 = "sha256-+KtNUW9gvAOUtPly9qfFG6KgItjaajuPmqHZB5+7Uu8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
