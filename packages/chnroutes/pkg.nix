{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8db4f54d41cebc168bba99805579dab6ec0b97db";
    sha256 = "sha256-jEaxcPgDUwaVwEH1/55UfGbIgrN7QW0z5GEylmzpS/Q=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
