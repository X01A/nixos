{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2026-01-01";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "47f74b5c21fe952efdfc159cd3c0920cb649f5bc";
    fetchSubmodules = true;
    sha256 = "sha256-79WWEGoVlEf3lP04ao/qg6Mn+Ne9/sAL6up8/Sns0NA=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
