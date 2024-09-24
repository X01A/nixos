{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "dd0fa61a26e36e23b2c5bd7bbd1539a7778374c1";
    sha256 = "sha256-CYn+QoYh4LYKBYQvR5zAsfdXC915hMX5Da0UU+pgyoc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
