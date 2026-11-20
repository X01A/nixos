{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "4569aa2f0e3c3c0801abd4083abe43b70462edb2";
    sha256 = "sha256-y1rTvXiWNdUI2vB6S6hhjtK1cxa8UQfD4MU8ehmVq3Q=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
