{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "185e64a3838e3afda0a3333cf60ebb47a631d25e";
    sha256 = "sha256-ziD9toakXix98SrylBrL5XwFPiAfKTGOxMyvUbLwN+8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
