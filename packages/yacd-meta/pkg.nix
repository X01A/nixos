{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.7-unstable-2025-12-14";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "7643378feae9c9f44ea41b5143cd98e5135f9b9a";
    fetchSubmodules = true;
    sha256 = "sha256-mDUgK17GEltMZdI1HJiDvOVAtRtLpPwdYwR6zWTBAE4=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
