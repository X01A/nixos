{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "2253b0862cbecdc82aeb84996c47ed8be1d024c3";
    sha256 = "sha256-pVlCaqgVSsO3tL92XNs8X+guYOJD0KpSicHBdBGg9VA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
