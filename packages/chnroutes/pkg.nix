{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "af81b842af8c3e9c3b98629fabfb46b9eb62d38f";
    sha256 = "sha256-96wtqJIAwgoGxdxNOGuDit9pHi7n4g+RfssXKILwVfI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
