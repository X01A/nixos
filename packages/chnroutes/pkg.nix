{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "2fc98e99c75c5023d3d783f482186a791ab7e674";
    sha256 = "sha256-UthF8jRoTP02M0JeYUnujJKt7BFqhSlpqCL7fBhouBM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
