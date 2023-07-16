{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-07-15";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "fa8f6c1a27b37c17cd89b9255a584d21f6ddb7bd";
    fetchSubmodules = true;
    sha256 = "sha256-SpyDC+cgnKk27LgS6VS7hxpx40V2U97CqYgIsEbwDsg=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
