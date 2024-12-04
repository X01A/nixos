{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "eaa902aeb13017ea9a3a747b51eba862a7ff8c8f";
    sha256 = "sha256-qBF8Ngy5cwml/KHPYdxyfekTBYoSCCIjRd8HjQBuRGg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
