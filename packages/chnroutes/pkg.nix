{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-11-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8698cae5c374cf9c97ff4a1725488e7e1dd0fdf2";
    sha256 = "sha256-bRtLj2R8Hc5voz2+7XpemUPw4ILRenW1nav/Q4a7niQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
