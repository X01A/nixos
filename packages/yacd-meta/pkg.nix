{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.8.0-unstable-2026-11-25";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "255466981cc24030151d27abb395b2b8e0ec7cc1";
    fetchSubmodules = true;
    sha256 = "sha256-0/HHyOAkMhGwJHyyzOyhnIc4TdjqZG3ravRN7/IkFtk=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
