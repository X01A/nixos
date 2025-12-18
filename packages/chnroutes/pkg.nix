{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a2a4604e26539a4b381217eebebc8558634963db";
    sha256 = "sha256-T8h3amqMqOjGINBIlm+GNCWyGZ7G03C2biD9jMgft6U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
