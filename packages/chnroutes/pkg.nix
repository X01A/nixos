{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "433123645a0acca761042c8a6ceee5f16a10ba5f";
    sha256 = "sha256-9Nj2b8rHio67DPLg/LW1j9otlgFf2LVuBeX26sVqbUE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
