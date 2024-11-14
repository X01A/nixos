{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "85600d197c34135b465973f2002582674cb2be52";
    sha256 = "sha256-1pVcrQd1Gt4wUvbRkg3keYR51EgXxhFtkhommiY5hSY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
