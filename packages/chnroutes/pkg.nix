{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-31";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9ff25b620eb7c73635f0039d3205479d3276dee4";
    sha256 = "sha256-aHU6N+mTUVrqXqNYzpoCnVrszb2O5ngzmeEt6bKArYQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
