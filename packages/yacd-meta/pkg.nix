{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.7-unstable-2024-06-27";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "186b3a3d4ba5590d9525b90fafcadace043788ac";
    fetchSubmodules = true;
    sha256 = "sha256-n0MWfM8kQvQSZcg4Ri/QNZ1vUIwa0xRdmAhEC4YLmJU=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
