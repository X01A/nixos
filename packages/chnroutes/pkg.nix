{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c73b339a9312d4aa157cfe59a2dba16fcedb3bc6";
    sha256 = "sha256-uulRI9absOgnQ3bWOn0DFtbaoLu3T3FOCmkPBymxMfc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
