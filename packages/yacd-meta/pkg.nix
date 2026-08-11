{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2026-08-10";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "80ea9f94a39a476a602e8ab26c2d4450d68d38ce";
    fetchSubmodules = true;
    sha256 = "sha256-6ev44kq38H+f/rQ22DE/3GWEVVXOZJpbavoc6iXwTmI=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
