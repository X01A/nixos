{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f6aa4c83db39b12f8d6fd9c61ecb427313c590a4";
    sha256 = "sha256-G6+AnV9ihU1ZN0WQefYpmbnsUyAxzr92Z8A5Sg5nCgg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
