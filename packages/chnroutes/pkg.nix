{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ffb87016ff4b5bb86f1dea38e38b20336f34f7ba";
    sha256 = "sha256-jmDpUCG9FJcNuj75CZn6cjiLekdxPRyuS3V3JzlGFrY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
