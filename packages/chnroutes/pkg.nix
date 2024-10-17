{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2085d96b58e909cb4fa76933e5c671fd02396d82";
    sha256 = "sha256-BqfVpDoIIaXVAhURRMFEAkKQ72dW1RqVxrY9SBv66Fg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
