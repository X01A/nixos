{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a41ce62a4a14d08163f10bc045dba0d858742c87";
    sha256 = "sha256-iRalPcXPePGCWxY6kVXiF3JcrEEZ2bUt5bh8pvcFasA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
