{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "16a796c74ae1a53e7a802e948a196834eac759d6";
    sha256 = "sha256-jlI1oWCkTWIH17d6ef4Iu9B9XkZBjHG1eDcq/RBRbW4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
