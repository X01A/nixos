{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-17";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "7343593113a3f27259099e23f90a92a2967014b0";
    fetchSubmodules = true;
    sha256 = "sha256-RFLgjSQoC2IWmFBufMXpAqByDayy1gFEfBzeOh4Xg2Y=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
