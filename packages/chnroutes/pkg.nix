{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "07aaf360bda7f1dfcee6168b178b5fe49ff23f15";
    sha256 = "sha256-3EHRX6QQFaUnLYIq3GS1afgQUlB9AqfWndGWAJorfHY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
