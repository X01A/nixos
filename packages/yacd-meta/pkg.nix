{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.3.8-unstable-2026-07-03";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "335d3a034f46c61fbf7fe22434fd0f1c503a168c";
    fetchSubmodules = true;
    sha256 = "sha256-n9ypAM27CuSjCWwWz2egVo48ZIWcJOfVN9LjrT5vJ2c=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
