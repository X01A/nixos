{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9c2472422377ae23a88af32316a025b14df7c030";
    sha256 = "sha256-AR405XZzZtXpm5LchqH4CQCUDu2aN68FTRfYWSaU+uY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
