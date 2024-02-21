{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2c3cd2f4ded21a9bfbbad34d9b1386c8de9565ce";
    sha256 = "sha256-rgpa/3jqcrcQBTfXwMq3k/sEyLn22fQ+djj9U0vGyHE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
