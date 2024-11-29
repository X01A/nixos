{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "dac0e08e2fb6e36b71d1ee06570584972912510b";
    sha256 = "sha256-PGNIadYyyOiMrwmftd0j+NLEbzrXzlpSSv5Cua5IFTQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
