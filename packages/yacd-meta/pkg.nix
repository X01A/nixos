{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.6.0-unstable-2026-10-11";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "8402051bc17496e827f9a9fe808139cc10ad20be";
    fetchSubmodules = true;
    sha256 = "sha256-yvIAGvlXWDb47cmktFcvGJ8K1heOsmmJT1+GFFWCavA=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
