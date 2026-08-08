{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2026-08-07";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "aebef5a497b1d58eef5aed310f4d0150a50aeeed";
    fetchSubmodules = true;
    sha256 = "sha256-OHbWuDifppHHPIJTNNaaBZqehYL68pyc3xbhUH2nMm4=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
