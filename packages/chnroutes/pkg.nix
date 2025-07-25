{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "423171861c5b8256516a4be56ea1b7ac6f326dc3";
    sha256 = "sha256-rhHKzNTs+k9XxblLgysJVklY8qfHZnmtm/kJePvHywc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
