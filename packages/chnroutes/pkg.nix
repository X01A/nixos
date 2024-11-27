{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b89c49f98647d6d24cc114874b780a9441c63a55";
    sha256 = "sha256-9VgW3JyWWtYH0KNRcpgaZIuQ6CK9IQ9+YhrgpBgheBc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
