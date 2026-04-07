{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "4c281ca533debde7ab501b19ee99d6d6b1d1bd79";
    sha256 = "sha256-Pgn0hlJP94vPi07VOE6zBJdnwQiQl7Lijtq2u3HNIJQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
