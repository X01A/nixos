{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c64bc45e5a12b2e207d3515977137c3ac4655c9e";
    sha256 = "sha256-jsHNwbI97VjTkWAD+5j0At8qavtjTPb35HjCxlMn+XY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
