{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8579f71e61f0ddcdf4d329dcb2e4bbc1ff80d8d6";
    sha256 = "sha256-4LgSd50GdL2uA78RmcY5YlzpMl+B+jtuGR/gwzldcJ8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
