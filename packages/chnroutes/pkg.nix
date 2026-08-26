{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "049b22807b47afc5068fd5879e37127885dc0908";
    sha256 = "sha256-s3M4vzv3GwkJ3g6RA63u4M9W4zuz9JnDf3NAEZ/eAYo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
