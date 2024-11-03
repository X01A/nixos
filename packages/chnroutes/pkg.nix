{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "81a94b6a28f38c5abd1da4f2a02b5625605acc8b";
    sha256 = "sha256-uCOhTP8gF4efiBjmmY3kjbpW5gtmZV1I4X14xftX39g=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
