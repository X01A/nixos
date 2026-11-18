{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.8.0-unstable-2026-11-17";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "328162b8560e495ffe8f313fa1bb504db873896f";
    fetchSubmodules = true;
    sha256 = "sha256-CImO0guc5Bx1clvFe9V3WnzG0sv17+ItWFZhPP1Lq18=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
