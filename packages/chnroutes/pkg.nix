{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c95b31064baddac161e6354377a6a4bca6e7fad7";
    sha256 = "sha256-MOBHkJHCTY78z02uODtYe3OGs85k6DW/U2RxIBYG0vc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
