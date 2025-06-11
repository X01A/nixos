{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "cab4f1cbbb386ba816e55cbd07bf1d7b5560430f";
    sha256 = "sha256-7uF4UUAeZ83frU8rlbNBcFjcYb3Z+I3lRljseM6K8qU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
