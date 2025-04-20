{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "bfe1d024ffb6fbcf5be0ff53612f1690d1590af0";
    sha256 = "sha256-RxGusV//CfUv+A+0ZaBZmhMnyBJjzk8BBsZVcMqJKvY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
