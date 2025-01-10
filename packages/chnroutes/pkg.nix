{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e3a6325957ed4c0c9e66086a0c13bc2707368578";
    sha256 = "sha256-IgbgNGnxW3tVhAV7DwRvq9uVib7KNQCKTs3DO7LXG6s=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
