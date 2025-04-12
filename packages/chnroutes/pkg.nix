{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c63404245b732379d823e798a47a66c9ec7fe270";
    sha256 = "sha256-J0iw7B9Dl5kBPHqn0MMLbs4QIK/DqQxhalNo8ij9TKk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
