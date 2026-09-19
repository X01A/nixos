{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.4.0-unstable-2026-09-18";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "79848583731bd6b0296466c9483fa557f188391c";
    fetchSubmodules = true;
    sha256 = "sha256-t+RcXlj1QUdaX0tNKtHpj+z5ZyoMyolu/b1NMv8aBZk=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
