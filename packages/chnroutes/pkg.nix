{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3c1a7b41e144abbc93bd8b032e480b2e8adfc4d2";
    sha256 = "sha256-3w7WUGjH0bDD/qgzTBtlctF0s/9LW+vjjLWAqopye84=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
