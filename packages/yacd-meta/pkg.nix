{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-04-13";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "a64f6bdc8079d599dc3ffedcc2a72ea1a794015e";
    fetchSubmodules = true;
    sha256 = "sha256-v1LjPwNenVyfyaT2+0GM4WE972MqzLK4MqpA1t47iI4=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
