{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9db921e1c57b47c6eb465d56f62e7b3d46e87b73";
    sha256 = "sha256-3kFVJYSpcB79yh9yif15XpQQY+Eh1R208DODXO58AUM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
