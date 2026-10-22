{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "46f3606aaec6c4615f7da10ae1c14fa98b118103";
    sha256 = "sha256-W7XgO/k8b7+a2z4g52BNRE7/bszOfNd4cCqcCxGwK4I=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
