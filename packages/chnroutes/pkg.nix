{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "f2371ffe61ee2067ac3d7de0aab6d107d72e7083";
    sha256 = "sha256-0d/5dB/cL52vJR5yuAyI28rAyB2GRuZ3jEtBmkmovDU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
