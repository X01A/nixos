{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2026-03-15";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "91895a24836d03396a57be01343a98fecdca2631";
    fetchSubmodules = true;
    sha256 = "sha256-agJ6inXVphS3fehYWWHVjdWznXLV/F59GnqLxSTSDfw=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
