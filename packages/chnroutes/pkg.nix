{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ddff13da31cff491c516ebe7bf45e551df611c08";
    sha256 = "sha256-PSjYGEUWZ3p0pK55QkYtIzuTGBf/a3nXY8DV633WytI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
