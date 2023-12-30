{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4547fc0724def272d189eac6ae817cd35091719d";
    sha256 = "sha256-7vTZ2bAKiS5decde00YdZZLBDTThFXZF+CjVjkXY6eY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
