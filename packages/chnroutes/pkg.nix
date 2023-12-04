{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c63f99a523c27c846fe03c7becfdd46080928652";
    sha256 = "sha256-p98AfJieCOZwJ2UNDGNzJbdX4SZ7Gw5ZEDkWJ/T6q0g=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
