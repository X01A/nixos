{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.7.0-unstable-2026-11-12";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "84b49e987408ad65d6c951944facb8e4b55d0c41";
    fetchSubmodules = true;
    sha256 = "sha256-xM0s09dZ48IqFUUURIUmxcR9osgrMS+DJpEdhgRs0MU=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
