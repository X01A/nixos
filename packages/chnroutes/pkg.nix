{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "be6c9dfbc97a30d39507bb0e0dbbb9d15abf0d58";
    sha256 = "sha256-Pn+X/esD4lLTazWE9k0VF8MblC382wNDMjYsgTT4pbk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
