{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d9f085ffaab8e7e8962d9de1d62080e62b3cda2e";
    sha256 = "sha256-gsl3Ta5sOafK8fgLWHiy3YDxvaRfAu9igNWo8TPPcFU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
