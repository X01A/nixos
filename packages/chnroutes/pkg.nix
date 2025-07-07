{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "6252eeb871a92e685e200035c29955a86abc62b2";
    sha256 = "sha256-y3iu+vd1RMZl5rGfZw8WgKEH/vkvWBYN2lUaW90iuYs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
