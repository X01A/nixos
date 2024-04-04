{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9395f7288b995decb9d22ede778124635ce6cc19";
    sha256 = "sha256-z5ERWwHJsrou1fMURhqrwbuP5BYs+Sy8p8CLbUHwHhM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
