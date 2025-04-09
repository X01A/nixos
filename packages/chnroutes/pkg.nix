{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4f7081a77230dba42c1c7d97ed34b9d4ce986eca";
    sha256 = "sha256-40uXHqzgrrmBj3WL0B7InenqaJxZkne+1EStVOH/q/A=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
