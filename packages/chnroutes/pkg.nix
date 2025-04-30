{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0fe1d6159ad92f624d636f00e29836e61c7132c2";
    sha256 = "sha256-fRoefV7K04exepOqv67f2h2q1Q4H1kQ8GBApfLTWK+A=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
