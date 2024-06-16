{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a1789be4e47e880feac23c6f93478cf4c18c4368";
    sha256 = "sha256-OKbII79rPsUWrOkHNZYBQKXV43o/qiISBlZ0w2FUKgo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
