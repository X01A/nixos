{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "561f644a117a7631dc9ab2e1b7df0ff782a97394";
    sha256 = "sha256-YvBOceKWqaQ0VcMo9DDr5OaAxtq9E981nKW3V5J73HI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
