{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "28675d106e250c2ef8368ccbc3d11b8da2b2ddbe";
    sha256 = "sha256-u2piuxA8P5OcyS2lbhrZ3ax19UMQagLRbdjvFZ8hkRU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
