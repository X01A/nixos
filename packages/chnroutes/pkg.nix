{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "dc61dc6e1ddf4cea26a7c8a256f9e9fa2d164fc0";
    sha256 = "sha256-bNzPNnS12GM3C17fmMgensdZto/coGnB06IKpQmNmJM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
