{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-06-07";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "8a1785553fc828eeb664245e2d725afe7301d205";
    fetchSubmodules = true;
    sha256 = "sha256-y8gIpiV6W3kT6/fKMDV5QMYKUlx/Yi+dPej4dAxnzEU=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
