{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-02-28";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "cc7d0b657e75033f3301db63fb1e04b79716ccc4";
    fetchSubmodules = true;
    sha256 = "sha256-HLnnRBON9qp4J2sCWl6bIxi4NNtBcIGwiX/OGCdQDsY=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
