{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "81814f1cce7fd687887e17d67d3a843a03b71470";
    sha256 = "sha256-7i4LNO9BbNb2DTD2ifP7QNVBsQ9VCyJFqXi2Gz/7QUc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
