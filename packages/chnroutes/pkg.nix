{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "eb6fbd44420e8e551ac5603f77196b8d0bcf0c4b";
    sha256 = "sha256-ceq7OKOEwveQBQ1sJuFE48TFX0cQdBxBzieNMkeazXU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
