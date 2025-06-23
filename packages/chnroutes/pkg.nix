{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "414b9065d3f3c35fc8ba0bab0e8a04967b32804f";
    sha256 = "sha256-3j4Ge4sp2seE+LSqpDbqktSTomYTyemERZPZH3Bgnvs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
