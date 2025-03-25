{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "17027cc735a4a79d747456edddfda351b83a8516";
    sha256 = "sha256-5aPiyMNt5g68lMcbcvVAY1jSEB5USJjNmb8LpPPjJYM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
