{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-03-26";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "dbebaa51f9a0d5e0ed2138539c43ab42eeafd7fe";
    fetchSubmodules = true;
    sha256 = "sha256-jXAffwZ1M/7/9pDTzXRsZMlntTlkLHdHTnnriZt5qCc=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
