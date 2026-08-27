{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "ad161cd5ce371e798e9c0e51c0ae6f1ef5cf1886";
    sha256 = "sha256-MHmzGHrYjC/wcEUxr5jcFEaDY4NjQjBzEZN4/KUevks=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
