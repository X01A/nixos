{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ff49c0226e8da0c76b9a218509b2b99371bf5171";
    sha256 = "sha256-ULn1rhsrjpPGczu8vUScI7Pmm9RjLFm+1dGtTIXspVw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
