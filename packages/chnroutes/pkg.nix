{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "1daad76b3eb22df3f33b7149de44fb300a9bac06";
    sha256 = "sha256-s0XRCUXIQKdys+SfPIqlGaem50GUxe6dbCyGRGKOj2Q=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
