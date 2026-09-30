{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "7374844ffc471d7b71356b6aff7a4541a5c63648";
    sha256 = "sha256-Lr3MOlXFo58LjVo9qkynxFl34GuvEhPx7igbplO9rDo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
