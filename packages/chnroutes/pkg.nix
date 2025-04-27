{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7c232d0349ba4869f3e30ee43d8bc07281b99c3b";
    sha256 = "sha256-DUJA9XYquiZkoe4HHiSKm8AlGv0auAMmy5G0zTTDV3A=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
