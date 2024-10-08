{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c7451095cc77bfcfe2a27499633b404c6962bdf3";
    sha256 = "sha256-nI2DHwsxezluVN1OpqKDiCDYa9p+5yasyl4LMmWBCD8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
