{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2026-01-16";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "ac485b00be400b6c6efa3c73a579ac419bc439ec";
    fetchSubmodules = true;
    sha256 = "sha256-cuLggZCmrbUdACV6aUny+qYMbWlJZhORgmWas/SN0D4=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
