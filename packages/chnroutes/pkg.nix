{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "060d61d8ab39d639483b7582f230522902edf494";
    sha256 = "sha256-JSk2uOsKWAvy3xM12wKoYceYItZMXMCh75ct72xDZjQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
