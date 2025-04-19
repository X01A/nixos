{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "6fbf3b1463b90bfb90b099fe0e6de3cbc10042c0";
    sha256 = "sha256-4Kio73m8DCo1ZXy6uBmXbGCWhTtCQ8GcnVJDC3k5Cdk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
