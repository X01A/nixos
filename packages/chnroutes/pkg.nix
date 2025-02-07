{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c2c1c5d0237b745d82e5fe9d003503090e7437cf";
    sha256 = "sha256-TS4mnLa8MAYgMuV9K/ClEHJ4PzPkGKB3OXqGZqQzqEo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
