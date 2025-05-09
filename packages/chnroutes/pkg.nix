{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0ecb73782571d22d5dd5ff43d0a51b0531d7e20d";
    sha256 = "sha256-3HpxJRrImYbZc47l9rhF+KFIANyKtLwTvgji1CPhRBk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
