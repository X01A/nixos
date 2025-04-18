{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "02f2c5a2cb335c53e592398d8286c1e2783aaef7";
    sha256 = "sha256-7gSdV+ss9J7LDEejnjzP1nOq87jqIubgT5Eq61sybHk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
