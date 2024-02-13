{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9479d50bffab3bdee4b77e17626b290a312c458d";
    sha256 = "sha256-E31UYM04K3d7i/KD2rBYt7XoT/tb41MTln8U+5pHrIk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
