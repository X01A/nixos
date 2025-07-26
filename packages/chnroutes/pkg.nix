{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3dd792eb4c3ada0386cdbdecf325903f68f6fb2d";
    sha256 = "sha256-zMYjDkaCsjf0g1XfZ4f7cmyZ63Uvm4Z6wQvF9u29gyI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
