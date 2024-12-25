{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a0c8bf3c5e9f0e5d0e0c177ee5b5521fa4c9a549";
    sha256 = "sha256-2R5TFfiSdx1ELNzE39Ueyd0fHvjO/9quQFP6xzX39ns=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
