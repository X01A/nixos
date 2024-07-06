{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7679b8d6345aae79942c17db681e4164f86a8687";
    sha256 = "sha256-r4KvvtugPUedmHel/DrD1maKlgVihj2ryddHC3G6qMk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
