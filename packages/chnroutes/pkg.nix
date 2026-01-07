{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "c13d7682fbf376afa4d08a6831d99c0ab0871538";
    sha256 = "sha256-WaxxfxH6/caPLC5MInEeC3nH2vwSPoxC0AXUbV4cUR8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
