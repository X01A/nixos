{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "802fb7e1792083822c9e454c830be31182d76141";
    sha256 = "sha256-RhE5FDpjsiGc8CnAFFR5N09TfIXRCkVPCgko3jsp1Ig=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
