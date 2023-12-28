{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7124330ee44397b52216ffe7a61531436353c388";
    sha256 = "sha256-GQq6TI0hFONVHz8cq8sUv92y3z0Grz2PCAlcVuLtgm0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
