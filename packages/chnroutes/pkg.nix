{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "e64a5071ee7a4e632f3c95330cc4c6e11897c5d0";
    sha256 = "sha256-/xxVlBJRrlvmQNaw5mqXOF+PAF7QEUii/S6aLaYOohM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
