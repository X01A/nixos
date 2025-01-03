{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e5d90e17ca09ae8592b7bdb8decd1f2950a590e5";
    sha256 = "sha256-OBbHEz7ApCvOSWIac0SDO8QAPuTwRb5TUXCIg7kVARM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
