{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "610f3ec825b845f284a97847ee847f56932396cf";
    sha256 = "sha256-ZF/HljwrO0zU+R+bQ8y2+UYMF7fhhCW3TekR2XVcCc8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
