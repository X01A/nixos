{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "aad59110749cb3a8877297829e18373ba0456c51";
    sha256 = "sha256-BeNq8x+kEajbCHbW0umiehWXT7VmCS6+L7rHvM/Cel4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
