{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "39b6df4c477243dcf95160a67a340810bd77cadd";
    sha256 = "sha256-6f3Es9VS7ctOS6OVorutELPn+SLqxF2keA6ffE1igW8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
