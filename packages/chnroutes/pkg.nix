{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "567cd01ec6ba71304d401e8e1effcd57a6441144";
    sha256 = "sha256-Z60avrFf1eVs3EWwoGA48STz3hCBetICYqcbASZu1Ic=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
