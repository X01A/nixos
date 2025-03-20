{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "1fa541e9c33549980c332ff4a9911a66b598661a";
    sha256 = "sha256-iESfOEcLsYgLVxRETIcpCF/BabgXSLDVw3Q/cJK4adQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
