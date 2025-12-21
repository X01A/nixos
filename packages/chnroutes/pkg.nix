{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7231026761254beaaaa852a6b1b89e1d13ede132";
    sha256 = "sha256-P4BAlFzUE/MpmnsdIOxWj8ii6rM9AtRlLWTzm+m5px8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
