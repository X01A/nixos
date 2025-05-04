{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9f1c039c14ae7b6555ff15bce9c820a8d50393e9";
    sha256 = "sha256-UWi6DEUlQE0sOBO74+Q1RVzhR+QH12YRc+H7X/HMWWQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
