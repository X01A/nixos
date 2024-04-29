{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9832eba02f58b62fa5c69b6a06e3cc53fb6b7bb9";
    sha256 = "sha256-bq73iwS4qLho9wRgo4IBNkBL8hiuBobkfTwm61unyT0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
