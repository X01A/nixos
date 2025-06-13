{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3b5db1286b044af4d0ca2124ecc3c13500f4dd73";
    sha256 = "sha256-o512+fHPIIguDG3Kn72vQMJGoW1wujqXC8BXd6oypkM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
