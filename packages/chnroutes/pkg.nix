{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2ff27bb11bebaf0a055852ca2ebdec85cb44a46b";
    sha256 = "sha256-h4xhFEho8NlWO/Def5ThrApQNf00T2m0MENhee31zE8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
