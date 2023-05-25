{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-25";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "ae0f7084b16c1f2a532c6dd234078735376f6939";
    fetchSubmodules = true;
    sha256 = "sha256-+YJ891gPadR89ruCVoP5qIohVKxvGORaKRFFIvvAlCI=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
