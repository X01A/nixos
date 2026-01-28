{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "0b33c72170eff00f233a863b61cf5d3103a134ac";
    sha256 = "sha256-NZyQyAdYM0b4w4+KVy5btRoZNbPcaOPnzSZ2Mil5QmE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
