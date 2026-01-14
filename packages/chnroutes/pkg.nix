{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "2ba867857a822285f3e775dc3afc25546f9a5de0";
    sha256 = "sha256-XnDXpZ4Y4c3+NIMpdqkF+IEjUxRzqJFGHscROy9iuUI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
