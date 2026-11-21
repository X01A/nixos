{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "45c964cb7c1a534c75e0358c5d6834c9cfe72f20";
    sha256 = "sha256-7S7adz1s9kuv+lkK33U/07SvtFGlL15SbzyTqVwBiNU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
