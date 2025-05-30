{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d75f8fa7c07607a1269a308bcee2a069b9f3e9c7";
    sha256 = "sha256-mqkVW1Z1RL+KGV35+HGqPpdtBpg84rkj+SiBi1MmT1o=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
