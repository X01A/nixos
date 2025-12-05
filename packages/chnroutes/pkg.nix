{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a00398ed8aad60a84eae0fe35b5cb1da4fc4ea38";
    sha256 = "sha256-dakCIQqFURvYTUeF887q8pNoEnq9dfWZIc09fF+RKmM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
