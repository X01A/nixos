{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "67599b0e0da9dfa3a6caa87bbb9fb27f867294b9";
    sha256 = "sha256-KnpDL8nNO2NwnY2jJCNMB5xYkE/srY1OoFKzLQaIqDc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
