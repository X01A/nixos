{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "229e486ade29eb13a7173dae015da288daa8abe9";
    sha256 = "sha256-mYphRXlzEEY0auJY8OmSTLfQt9S6NFKjNHKnru6krTw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
