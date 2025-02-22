{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0e97a90edce838d0816a2f30665dcef84db4c63f";
    sha256 = "sha256-fWlsgS5t9OMEtDVVuGcg0zXOoY8kzGbo225X3bdFNPE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
