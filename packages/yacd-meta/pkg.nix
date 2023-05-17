{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-17";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "6600d10eb41170b797792b4c476c9aa6a7bb436e";
    fetchSubmodules = true;
    sha256 = "sha256-icExfnk5+0iBUZTHL91rar1nkeMqeqs3sdP/I2DpN/8=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
