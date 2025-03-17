{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7d887cf346f59be786c7d9913078896e9bd2ed20";
    sha256 = "sha256-ocCUiZaQaI+N8+vi+OJQb0N/gLLTwhLBoaZzJeyYlzA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
