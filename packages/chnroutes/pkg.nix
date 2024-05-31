{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-31";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3c163de7793ff4cba6a2aa3d29172bf4bf8881e1";
    sha256 = "sha256-vXM5znhQFZuXWUoWs5dUGR977o70QnxdY2sBd+EBpmU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
