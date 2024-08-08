{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "de943d261eb3d2671c7b1c8c665ce696861a26a1";
    sha256 = "sha256-ehuM+oyZFsdg/RoW2l4QyHy0MwpQaoRuTeTsKc/PkHA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
