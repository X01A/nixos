{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2cec38816958c4c87eb9f54eba53c877c67a6657";
    sha256 = "sha256-2nABWtkMi4g7qlaC5FO93VUoK1U+D+wpcKlvypn+Xpk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
