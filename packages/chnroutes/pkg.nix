{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "1cbbdd7d060d2bbfc703ce3f5e1a54c1aaa93457";
    sha256 = "sha256-XRXkbK+sWhhLCWtzMQ+mpRNz2PooDEwE0IelUwIalu4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
