{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-31";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "dab7e4ea5525ec3e64feb6ac28451d073debdbde";
    sha256 = "sha256-k4MjjDel+Tf2zlmgVvtwf6MFiv4z8rwyKlyDznGzEhM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
