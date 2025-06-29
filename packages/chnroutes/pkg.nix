{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "00dd7490e0c39eecd94c18dda290cc847c9e9d18";
    sha256 = "sha256-U4UlxI6tMuhtAk027JuayfmOfEspcBpMtDi+qdI7p8M=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
