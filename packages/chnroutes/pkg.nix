{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "28043cbdaab9d1642a0c6f0ecac912cdc4bb3fc7";
    sha256 = "sha256-L5qk/IP+gBHzPWAa43gOVgwSDqEeDWYqXcjFzJi7DWo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
