{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d9c2f4770f0ee2391d129e6ed370308aa8ae27ae";
    sha256 = "sha256-CroIkeMq/fofYP/G/G8QdQ7GJoKobyVU3tcq/A7c6/U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
