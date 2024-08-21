{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "46cd0196e653e2aa19321cdb52882ee1a3ee286f";
    sha256 = "sha256-AKekrT5Dx/8IDBM4NX1FKg4SEQTSAmxlyev2iiA6RNk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
