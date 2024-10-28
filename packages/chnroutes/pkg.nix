{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b1ac254b5f4e6d5f1df51ed7824fe79745731ab1";
    sha256 = "sha256-yqZ+2GSX3dWU3I3HsyMGal7+QzvwJ08WxRHFp9ZcgIQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
