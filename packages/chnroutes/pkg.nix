{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "7f9803adfa825b3b41d19ee45e86880dfacdb30f";
    sha256 = "sha256-sAzIS4ujSD9KuJAm1JpDJE05Yf7P2q5d4nMm/JunnDc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
