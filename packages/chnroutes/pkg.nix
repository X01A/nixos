{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "25669223f7bd1f0c43a308ba8aa6610e7cdd1849";
    sha256 = "sha256-2nZ9ZHU4Qq6HtP+DvT1vXtGl60Fzjhyoz7giU8+kJNU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
