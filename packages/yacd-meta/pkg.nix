{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-06-26";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "234870312d5d8415d99597d717040b147d2b0ef9";
    fetchSubmodules = true;
    sha256 = "sha256-jd93ik2ZMzLYd0wSy0m0DzQAdxiVoxQ50RwT+sZeVlA=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
