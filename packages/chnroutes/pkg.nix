{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3051a228bb41308c9bc4feb5b2e265accdccdfd3";
    sha256 = "sha256-8Mx/kz3yhwZk4J10mY0lA76U9+rfY+dyKDruwEvt0YU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
