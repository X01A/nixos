{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "910b997f5fc07a28061c03d2f23f778c3c15dbee";
    sha256 = "sha256-23ENJJ0DSQzjQTr5rKqRn44sEfZZgTa8nO2k3DHDGwA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
