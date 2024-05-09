{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "dd626511ecc8276b18ed7d793e69ec4b1eb2fba7";
    sha256 = "sha256-qmIc4z6FS2KvAExCQyvPCoJvjP0FG7zjEetELFUE+FU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
