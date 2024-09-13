{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3b62f0e44992e15c5eae45b2f7add835987d533f";
    sha256 = "sha256-kyXdciaFcnl7R9IXO1nRtR6j2MhtKQy86mA0PX+M/oU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
