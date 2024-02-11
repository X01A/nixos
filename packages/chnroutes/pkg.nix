{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8fe3c1207301dc99a02f72e5a905839d719d62d9";
    sha256 = "sha256-Xrqt5OPKfaIwHsK/boEsxHNf67Awi2pS+7azgaWaOAA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
