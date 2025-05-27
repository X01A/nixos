{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "6ee5c8c661316d47f1d5942719c1e0534d16f850";
    sha256 = "sha256-CpLQAlvUJZyxU4DGQ//rX8CnvJMkDKnXagDHarDbtWM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
