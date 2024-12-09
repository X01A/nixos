{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ebc4033d3c7045b91fb17bf694f5b9469b597bbe";
    sha256 = "sha256-fKKnCcGxqQ6IufDQzfuqoz9HUWen1VS/qioYnrVX8P8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
