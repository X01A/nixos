{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "aa727a1a63ef475f7a8e6e50eb301a347a70c4ba";
    sha256 = "sha256-RNGjtGmhwcXiPAPW10YEh1VInwi1NdEs28Nd25tNxZ0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
