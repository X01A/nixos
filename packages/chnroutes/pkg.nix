{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0a7f744df85bb95d01bcf85f5fc47d4a8c33d68d";
    sha256 = "sha256-2HW/FkESMr4CZzuqJZdk4kdWpi8cYKURWd4Shav5u4k=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
