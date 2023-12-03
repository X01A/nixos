{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d6217c6f9e14970bfee72d7c587b030609776527";
    sha256 = "sha256-lksIbo4DJnaq/ucBCi2YTYzSFlb32y+ogVJWGbOPD0M=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
