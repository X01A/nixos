{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-31";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9a97c884e0463dff78b9d757636001c4e057541d";
    sha256 = "sha256-4fDsWfXP9O2zi1t6HkkQhmNCYoGDb5M/t+0SzqdbTto=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
