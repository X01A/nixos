{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2cc25301e4e83a4d021f7456d86fd8af97074456";
    sha256 = "sha256-vUYeyfAKZNixavFdK0FeAxrRGbs2SGQPmdBW9xX1NYg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
