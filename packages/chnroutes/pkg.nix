{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "c11e48a6d71fa1b54ed0aa639a8c7a1ae99994ee";
    sha256 = "sha256-KQggZcdSaTbg5j9oFbumoNrvrghN5Plqam5Wuhp+4ME=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
