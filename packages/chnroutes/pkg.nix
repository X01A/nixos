{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a594391d3863b8a6e023e273b94e0ef2f7b80377";
    sha256 = "sha256-ZGTVGPbI41bGMuDf4eaYsxiqdQuiLWWyhrUytAO9kSs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
