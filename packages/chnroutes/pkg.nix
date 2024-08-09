{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7e87b9f26c6c190d5e45c7f08ba334253358ad97";
    sha256 = "sha256-5lWzVXyJ/JmbIQuuEDouFzhYYyvjp7q/XbKYYt1SfAU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
