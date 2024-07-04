{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "327da37dc2d6bb300a8ef1ac18a63d5ab0135f23";
    sha256 = "sha256-i0CZBKKRHU/cFzQSB+gtyT7/0DqO/CDSoar07Y1cStQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
