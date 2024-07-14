{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "85d696022deaef99ad31d99a78caf30c08c8b83e";
    sha256 = "sha256-g04hHBnAjCqjwUNV10S8olvkh/Z4pXA2Ubc8xh77/NA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
