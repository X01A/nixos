{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.7.0-unstable-2026-11-08";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "9d24ae48d860718222f34f0d3a31d1e49ddac3c9";
    fetchSubmodules = true;
    sha256 = "sha256-EaF+8Q9UB9vUtIz3Z2RsjZ80ss6MMkcpQ/fYy1YdhAA=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
