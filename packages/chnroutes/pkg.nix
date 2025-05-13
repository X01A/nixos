{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4071604193865f8adfb97fe99a31f2be5b9610a2";
    sha256 = "sha256-TJToBcgMPlWpBh3ASKKNToke7nqxklv4S6OOO5tyl6E=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
