{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "391bd8528c89b3cfc264fa8fec28d59b5074449d";
    sha256 = "sha256-WYpvMSOpKtphoCa9y8Q19r0fB4hDyPeNuKTmdI3/e3A=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
