{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.7-unstable-2023-12-29";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "b66b1d0393bd284b7a40329f95eae3746bb102be";
    fetchSubmodules = true;
    sha256 = "sha256-mbt7OSHNLseXRAQ8YsQL+FVK3EZ74UfbBWRddYBGUYI=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
