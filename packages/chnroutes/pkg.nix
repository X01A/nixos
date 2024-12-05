{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "827ca3cd295eb2a9c745e25cf03359d9b6753248";
    sha256 = "sha256-vL9WlaTAuk0iIKcewDFsBuQXnzUp9OKPi+r/37SEghM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
