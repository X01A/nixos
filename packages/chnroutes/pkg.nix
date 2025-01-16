{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a2733e16cee24ea5fcef2d1c0cd913fe36c6b27b";
    sha256 = "sha256-lZv5uHOU0O6+0+f2zSoe3g2heNF6/sxHfLl5WKcVK1g=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
