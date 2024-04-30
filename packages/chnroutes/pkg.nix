{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4fbcd727465cb729388a4135d123bc85d4f190c0";
    sha256 = "sha256-I010fYQzPiQiciZY87o7Y0J0nJDTBPUCTY9nUnSgOnY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
