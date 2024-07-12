{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7486543ab21395701505df9ea898ecf584c2cafc";
    sha256 = "sha256-WQgS9Jn3CshDCvfLFWLM1kHZGH/iwpINZrbVg0neP/Y=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
