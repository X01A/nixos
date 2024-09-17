{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "35a501d52dea2fc3ea425f46d0e37e6e708f4e79";
    sha256 = "sha256-pUESkXxaVx+XWTgAo30gIbM/SWaM7WzUQdm31J1bAv0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
