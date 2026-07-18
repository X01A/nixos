{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "cb6f3c28bb8d1992c2756eb4939fa5602753ce18";
    sha256 = "sha256-WbwxhspAf2NK98/wm0m2soIYbv7FVgxuXwPeXDu8gXI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
