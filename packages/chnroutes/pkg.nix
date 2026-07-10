{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "e5e279c90b5d9af048b4aaaf1d2fbcd03e9823a0";
    sha256 = "sha256-nkFwdhqIzYdSXGOQ4m6rNE5yp3XG+ryh/gmXewfIn9o=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
