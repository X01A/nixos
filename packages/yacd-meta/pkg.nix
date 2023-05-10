{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "unstable-2023-05-10";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "cbece8dbf9775ebb37be2dce67093cd541bf952f";
    fetchSubmodules = true;
    sha256 = "sha256-fyIdOlA4PPjhsFGE0n5sWX5X3PfHjv/hDvYspfGTV4E=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
