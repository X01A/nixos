{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-13";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "f04b0a81103f48e8d990aaccf82c6dd9692d3853";
    fetchSubmodules = true;
    sha256 = "sha256-6nFgSJP9Ge5iM21IbTSGKEnwUiLS0xu/K6PjEYfQbOs=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
