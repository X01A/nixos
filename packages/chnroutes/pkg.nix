{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "ca2fbe4aeac7b58a859b840ff08c27375afd4f90";
    sha256 = "sha256-BT3qCnCc33ezsw+2KAxZD1QaIFmhaQXwYq/8re/Rn3w=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
