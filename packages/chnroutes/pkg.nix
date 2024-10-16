{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "5e90b95570d089f71ecb94a9ee805c465b3ae5cc";
    sha256 = "sha256-ObD7BYEEDFvk4Kx7ulqXalSbZHBvjQlqJ4489E6CWhA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
