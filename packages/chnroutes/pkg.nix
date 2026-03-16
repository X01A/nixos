{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "9705326f0cee225ec4b4eb7307be0ac71c472797";
    sha256 = "sha256-hhMr6m/mFm+0kHl8r4/PXBxEqvJ6PnVUOWuoFPmbo9E=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
