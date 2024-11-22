{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "045c17042fee5186124c639b4b1041bd4e32f917";
    sha256 = "sha256-OajxZqNiftFkbLECXLXxUefWJ/FvDGPsRd4sDfvrsnM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
