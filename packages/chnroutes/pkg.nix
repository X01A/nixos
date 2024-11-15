{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8b652432973cf57dad703cd49402c7231d08bc88";
    sha256 = "sha256-Dafh7AegLwfN6NsmtjfhznAShyzRgb2lYP58HA+UQCU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
