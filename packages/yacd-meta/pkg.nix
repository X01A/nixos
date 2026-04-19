{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2026-04-18";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "313ea90a8bbd67628a765a5b1d5d12b772658e69";
    fetchSubmodules = true;
    sha256 = "sha256-vC46WCyp2LKLoy2Z5wu3P7o2nvswOpDoXEUr4n+f9bE=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
