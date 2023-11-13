{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "da645fb2a468fc8f738f9ec1a2c1485539afc029";
    sha256 = "sha256-9tNyP2aN5XSOXTxF49/ffCnqWMEsWu3frzCGGnTOOOU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
