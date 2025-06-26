{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "addcd64d3aa3b8dd377353f3d371a1af5e710caa";
    sha256 = "sha256-NBUO0HnKkZDxcdc6pYk6g41ErQ6a+/E6NO0q7ThvzSE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
