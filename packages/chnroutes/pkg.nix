{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-03-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "1acef2214cf28b4f274eaa58a31675d6c95e5159";
    sha256 = "sha256-ULhkfrKfTSFQ8mWgeqJ3MZnA/tec+puxa/Lv2jooRQk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
