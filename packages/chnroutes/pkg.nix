{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "02bc6b97199263d9a75b0e5f2b019161673386dc";
    sha256 = "sha256-hZsEwmNlUrhhiwSILgJeX0BAfaXVfQbdryAjiu69MLU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
