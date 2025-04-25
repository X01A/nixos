{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "58d60bd83a5eacb84883124f0e73bcba169b028a";
    sha256 = "sha256-fCsz8UAzck2WRiRgelw6fvm2R7zdRNEbKWmcAcNKVUI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
