{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "eafd9d01c8751f8fbd5dc7f1a5f7f180516c2347";
    sha256 = "sha256-2VyzOQwyj+UnnO1WDXu4puYL8QDkvY8TOkXzuciC/hg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
