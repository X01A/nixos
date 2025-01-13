{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ccae3651a9e773d58e89708a4e6051e7eed189ba";
    sha256 = "sha256-wt3CDsmuoDXCmMWmFng/K8nJjQ57NpAcaaOiS9OACiA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
