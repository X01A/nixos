{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0407990c499e58fdea0739237d6537b6f522e917";
    sha256 = "sha256-smy3GSxlvK999dOYy5X7XgoHLS7RI3vZ7t0DO2N9w/w=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
