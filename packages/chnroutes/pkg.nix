{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0b0017b345acd6d1c74f941b234e80fbda8e40d9";
    sha256 = "sha256-/ypMhOXbKOkw4dwC8peIwnGQJ8Hh/YAlcXrb9u/buYk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
