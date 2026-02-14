{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "219bf73540c84d1468ad0d5305085eb62b4dfd43";
    sha256 = "sha256-fY3vHyGlQhl92NMof/JryMqZjzq2rGD80kxGCQm1vdI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
