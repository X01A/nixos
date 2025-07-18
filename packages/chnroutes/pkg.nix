{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9ef65db58c137418ff670cd95ae8edf2cb02d58d";
    sha256 = "sha256-uZ3/WLAO514oUJntx8RUo7rbmtYzxHXwBOAHvaFtgrY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
