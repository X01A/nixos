{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0ebd5d5ea1f51ba3ef8fe0f5ece2b725e37abb3c";
    sha256 = "sha256-mnsXXjSnjR4zoWO+km4k0NhoE3Gj+ub8WQ98V0YbLwE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
