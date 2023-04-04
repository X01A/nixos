{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-04-04";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "5b47b36a3c7b3595905269807bbfd94f0603f26b";
    fetchSubmodules = true;
    sha256 = "sha256-jXAffwZ1M/7/9pDTzXRsZMlntTlkLHdHTnnriZt5qCc=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
