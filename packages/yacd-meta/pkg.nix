{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2026-03-13";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "a1b2fbae398e45a8c8d9e4546adf4aed4bf8d19b";
    fetchSubmodules = true;
    sha256 = "sha256-POHjX8H1rf6uuvVi4aS5uLOskWdfOQAg08fhuzVUAQY=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
