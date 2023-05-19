{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-19";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "6221e1405aa7d06d029bfb7fbff4035540674a40";
    fetchSubmodules = true;
    sha256 = "sha256-icExfnk5+0iBUZTHL91rar1nkeMqeqs3sdP/I2DpN/8=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
