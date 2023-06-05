{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-06-05";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "31582de404e24f8a56ca31e325ac273d210478e7";
    fetchSubmodules = true;
    sha256 = "sha256-pXie0oUwYZhX3qEk8xlAemi4Y+4ah2a+sYXcKFQ9CAA=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
