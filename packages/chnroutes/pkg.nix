{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "aeddae38ab989d904b744095c6c9c061602c898e";
    sha256 = "sha256-f6f4DiXtqItYQmBbZ3+iv3Bw5QzebKeVHSRbhv8WY9o=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
