{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.6.0-unstable-2026-10-21";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "24151c331027ff176b45ed417180c6f1220474a3";
    fetchSubmodules = true;
    sha256 = "sha256-wEZk/rvYd70svNU46zaY+xU4yzynIyQxe7jHO3RN0nA=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
