{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e7af5f6e1f01410bb2fc5124e9d8a6d866a95bbe";
    sha256 = "sha256-1KAQHpqIyrc/LbXV68K/ZA5XoDR1RQRgqU3+PApAgiI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
