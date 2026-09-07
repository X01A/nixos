{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "63fc182945b6a161e32824d07184afc49d748ef6";
    sha256 = "sha256-/ddCNjUAFNs7iT7w5Mwo4ifGBNp+qOdR4EnlF2d3kBg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
