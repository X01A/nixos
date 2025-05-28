{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "52b728cb5b48d6bdbb8ee604392035171dbf0058";
    sha256 = "sha256-sTx2sUPSyKhnaZZCxkq7Ae4Mk/To8hhIDPfvTNWSlUQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
