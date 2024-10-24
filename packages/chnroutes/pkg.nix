{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f4cca1823babd50cbc616d8e84e85a097ab0a7db";
    sha256 = "sha256-tX+bvYXYwG09OCj5p4uWCuY+2DqFoyfmI+ZKmyl6O+0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
