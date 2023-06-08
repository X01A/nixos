{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-06-08";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "8e5bb3d4115950420a560638805411cba9e6199a";
    fetchSubmodules = true;
    sha256 = "sha256-cAVuzwOrsasLA0q4PY1vPmqhh+iwhKjV7LjMDR1juQg=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
