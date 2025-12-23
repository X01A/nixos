{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "54b37facd14c2d399aebf8a2de9eb03ac0cb4cad";
    sha256 = "sha256-VHf4vgErzjwW4RmGSw5uvqlH6ZwOrl/M9TuVkMd3uQ8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
