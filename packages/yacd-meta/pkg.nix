{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-15";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "1938566a948aeaf1caae2eeee90d74f8a69497b3";
    fetchSubmodules = true;
    sha256 = "sha256-6nFgSJP9Ge5iM21IbTSGKEnwUiLS0xu/K6PjEYfQbOs=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
