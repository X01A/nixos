{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "7f67d6ffa23154e169170400bf9d42531e8471e0";
    sha256 = "sha256-jhkzXGbG4i9zt4NbBDT2jWPEbl3g8zHpJMU+b5OSfq4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
