{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2025-12-27";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "31059259aade807e841c909915aa150edc39258f";
    fetchSubmodules = true;
    sha256 = "sha256-6OCF1EdR9ENNEiy+0zO+lPq+79HTFrQZxznyjojRh4k=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
