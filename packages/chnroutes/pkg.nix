{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2a3fbcd9df6f8256bb4ebe5beb3da7e481822c08";
    sha256 = "sha256-Erq1RXiNQ5JHUUEQefbdFiRXLZUSSb0uULsO4qOvCaE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
