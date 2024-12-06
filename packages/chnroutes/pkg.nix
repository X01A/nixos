{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "fd3cf2af76e31f43c3983b89446182eec718ca44";
    sha256 = "sha256-oHgLOfhqqjCzoDPQHBKKjHKN6txPKTjN/RLPhK2uqoc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
