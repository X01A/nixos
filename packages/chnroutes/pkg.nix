{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-11-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "30715358906b5ef96da54ea8d25f26e82d60d284";
    sha256 = "sha256-xcy1z9gN1LVJudQnmvNZ0HLUDveFLMIgdJ1xpJTo+5Y=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
