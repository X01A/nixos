{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d861492d5266076d03a180e675cab39f1cff91d7";
    sha256 = "sha256-uoaD84GjdTWrjCNrEe7WowmTe1gnnlywvph9NxgTrSQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
