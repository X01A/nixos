{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-17";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "ae8f47af5a13759ffed476d728ad65cf506c6f84";
    fetchSubmodules = true;
    sha256 = "sha256-hvFtXuCHcGQdxKLrVtIrKGzCN2aZ0rk472QBAaUY+nA=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
