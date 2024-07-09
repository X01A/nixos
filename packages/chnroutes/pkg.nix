{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f671fcddacde585fb21e0a15711ac2035d38a593";
    sha256 = "sha256-tT1k+X3w1gYxrXbfHccyT5ljpYwpuqUHz1ayRpg3ILg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
