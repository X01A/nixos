{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-10-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d1434a7a215d6b86c9fa1290eafd42a2a083ac64";
    sha256 = "sha256-0MZc/0svgOLmnyA/qtXRJ4EJUOHqpi3a8EMQ0s/NzKQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
