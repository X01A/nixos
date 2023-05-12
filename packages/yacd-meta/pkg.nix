{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-12";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "0f8a84fe5e991db9052532a13eb3229e6b3f4761";
    fetchSubmodules = true;
    sha256 = "sha256-3aSK9HUkSu7NIo8E9LrCXbCjWtuPG02fx245hB90ynE=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
