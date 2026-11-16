{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "yacd-meta";
  version = "0.7.0-unstable-2026-11-16";

  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "Yacd-meta";
    rev = "2ed180f88a5d7aeace769a6ff6dcadab9151be6d";
    fetchSubmodules = true;
    sha256 = "sha256-b9htZ+RtYemnjdgINi/DRbl0XmOBqDW4JgZqv0p8bMM=";
  };

  installPhase = ''
    cp -r $src $out
  '';
}
