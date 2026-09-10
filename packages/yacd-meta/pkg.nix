{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.4.0-unstable-2026-09-09";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "6945744f5ab10d3d639d6eb76f3a67167da77b34";
    fetchSubmodules = true;
    sha256 = "sha256-XLHBRyd1P71DAGVgyh0Vpx1xCTGlVDFR6XOovOS1MLY=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
