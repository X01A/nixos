{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f625501f7a675f085f3a95155f22f2d66fbc5273";
    sha256 = "sha256-M54HsjvVTYO2/Q5OnLhUw4dl1Ta5EnTfOH6jBtbTMTs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
