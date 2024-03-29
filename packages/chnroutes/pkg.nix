{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-03-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "51ebbd68ac6c64efb5c64e99918295452aa9e4b3";
    sha256 = "sha256-T4lMJ0eA7Tg4/3FsJsKCoayEGwlX0k5pKvqjjWRSqbQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
