{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a300ae03fb85e28f1eb98bf58caee17e65a1cded";
    sha256 = "sha256-OEjF/q4sLxuMj6Q8WO7NLMce6YZBdkVEKG65qtIXsL8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
