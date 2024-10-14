{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b255f9b92fcbbdd189b8262d0b216106f9c96a3a";
    sha256 = "sha256-ORu2XrQP60i2mcgDDRd5WCbHpi+GFCQUZY///oUb1Zs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
