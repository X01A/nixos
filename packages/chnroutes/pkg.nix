{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "cf83503f8c53418aa2369a60c49e7c8a01d16927";
    sha256 = "sha256-vOVdIfx+fHTYpmBk/QMdPEI1SUC+9Gua1RW9fvgHqQg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
