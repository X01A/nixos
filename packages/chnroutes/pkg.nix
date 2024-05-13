{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4d3edea428e013326a86164026c427da31128fa6";
    sha256 = "sha256-V92C/QCjrErhMOaDA/jOkP7F5oVYNhfTfOWuD8qOrso=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
