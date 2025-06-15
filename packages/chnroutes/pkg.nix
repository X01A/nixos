{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e05869bc18041b5133b1e71185910fe32ac9298a";
    sha256 = "sha256-nkMpp/5KohhAQMX2nORSppsUuT8vfpMNRCY+ntPeHAU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
