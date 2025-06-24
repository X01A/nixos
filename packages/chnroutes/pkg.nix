{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2a03b8c997558be21c73eed6e8b92174f6e9f4fe";
    sha256 = "sha256-9jAoXaFghiBv5p3UI+yCgmj+yLgDRKD+tJpo6bqKZa0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
