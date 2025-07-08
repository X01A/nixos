{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e08efa7de79b3bfa0a00aebb11829def6effd00e";
    sha256 = "sha256-yCFbTTkFboDU9qFmKnfynKraLsXTPegOpTBC3Hdl0Ds=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
