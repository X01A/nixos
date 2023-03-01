{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-03-01";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "c3229bdf62b270d84dcfaf4d7e39811369dd9dc2";
    fetchSubmodules = true;
    sha256 = "sha256-HLnnRBON9qp4J2sCWl6bIxi4NNtBcIGwiX/OGCdQDsY=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
