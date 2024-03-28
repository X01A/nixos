{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-03-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "25f35a37e4d994403bac039ad71c49618e684036";
    sha256 = "sha256-K7DCxtbU/j44D5xtEZm80qdMGe0yHEehrx7ecBL3KX0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
