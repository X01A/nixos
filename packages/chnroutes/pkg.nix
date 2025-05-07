{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c6893a3e0b609266eb8b4a529a44e0e276250a59";
    sha256 = "sha256-JDmHMEfE6fqZl08Ej2uAmooK7XO2VzCznSHxxIvPSkk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
