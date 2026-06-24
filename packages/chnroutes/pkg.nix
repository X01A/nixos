{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "bcb36f4bb45b9bc96843d70a260cbb1155acd24b";
    sha256 = "sha256-fvgYUgHTmX2OQgfJGUTc/7t0yYLQ2+l6r3QwK1+6D0U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
