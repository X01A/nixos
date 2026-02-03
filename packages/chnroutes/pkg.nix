{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "0e93626cfa51ebddef4cc498910e8cfafd0cc472";
    sha256 = "sha256-e04x8Hjy/m0wDv/vZF9PTmpQRgvMZYFxuQWrXqbt4WE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
