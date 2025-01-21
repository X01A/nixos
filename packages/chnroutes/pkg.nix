{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "26dd9bd3d08f314298d6ebb842cf86ad116d41c9";
    sha256 = "sha256-9CpOKZH/MrkYFMa1fj/yJtTJf3cPIk4QL/e9Axba//0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
