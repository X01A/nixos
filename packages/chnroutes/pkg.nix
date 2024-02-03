{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "28ffdb3e30037ee10f69a2985daa1e2c096b1b0d";
    sha256 = "sha256-bw1bZ4p2W/cV/KeTh7yrJGQGrwtWytcdc6yzfNengAk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
