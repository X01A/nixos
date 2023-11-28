{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "226a769e2d8ef71cdd508d72302e98987f7af04e";
    sha256 = "sha256-OHRQlUI+pue32bxd8wXOu1B/SHOtbGV6bvyR/AUyO6U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
