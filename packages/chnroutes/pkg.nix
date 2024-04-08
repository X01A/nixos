{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "49bb516b6eb107fcac9106647cc4c072710f855e";
    sha256 = "sha256-maIm3exAhwM4OsSGYCnYEzZziWwbEPv+XDcYlCq3bNk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
