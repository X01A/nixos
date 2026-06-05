{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2026-06-04";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "2f3230cc2b51abdb3d286ba0ce70b359144f8a1b";
    fetchSubmodules = true;
    sha256 = "sha256-D82Xy+aUNQUT5LgrFFPHcyoivLTxOFhjUWSIOFIWZBE=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
