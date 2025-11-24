{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-11-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ad2e1cccbee8739175bd558813c734848b98e557";
    sha256 = "sha256-qhL9sMSoeXnnKeoGCz/hberHlaFOQFKZprB5urijbno=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
