{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "6ff5e46115d8a253c523059fcc3717a6eb34740f";
    sha256 = "sha256-s1/7T3hNL9M0rTjarb87W5Fs02ADhUh/R0F3vT0WHVM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
