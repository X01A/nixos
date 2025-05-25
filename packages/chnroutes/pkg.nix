{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "62519eacee49c913d7f51024cd7b891a2ccb0874";
    sha256 = "sha256-uyUzB1FGqfxsQc+KpioFrFvU0oRpa5nPxmNnHakm0KQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
