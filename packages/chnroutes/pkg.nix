{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ce0c7e600a70b2d07ed60a86a9bf0556e0dce615";
    sha256 = "sha256-3YKz7wMx15gZ+pX6a/YAXS7P7I6g6BpIfMlE8jVr4o4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
