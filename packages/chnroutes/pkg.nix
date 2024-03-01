{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c9f56a8c80aab44825314cf236b710a838d5559d";
    sha256 = "sha256-s/sm75J7pRvjo0vXwDjrwRevVM9yHe6vTXUEQ7VmhNA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
