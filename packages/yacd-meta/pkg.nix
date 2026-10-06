{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.6.0-unstable-2026-10-05";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "c0fe663983b15d00ecc4e94b4cc64959fd96c215";
    fetchSubmodules = true;
    sha256 = "sha256-NEHBMGr3DFxN9Q3KMMDE2iq3zGxsZIJoNB7xZ/oPB3g=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
