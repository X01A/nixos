{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "5558ecd01f6e43b23a5ffc5b4c2198c8d2ef8f4f";
    sha256 = "sha256-5hogvyJE0RNIV7zO3SU3HT5TqZeKDnooTHJlDofecy8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
