{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-18";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "b63723205c8a06093826a84a66315eca35877214";
    sha256 = "sha256-LwS+Bdyzc3TKTBg++u1r7b3YOgqIJb08pZg24uMz/EM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
