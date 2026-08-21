{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2026-08-20";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "5e19aba94b61ea734beeb1ae7e846ee355ca6a42";
    fetchSubmodules = true;
    sha256 = "sha256-Xp3u3j/bqYcm5zRTTAqAQNdnbgTWgob/zDKvH2U94Ao=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
