{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2ab1625697275d1e9a27ecbb1177dce10f69b9fe";
    sha256 = "sha256-duQB6hSH2EvvaRisXVjMYClvCYb0jRropSv53vMBM1U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
