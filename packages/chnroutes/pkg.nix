{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "abb51e74a6a58fd28e2dcff6ff4522e55c73247c";
    sha256 = "sha256-ALSq9L6UOyc+EpSy3CuSEQ1J4fbgKR9pXjHznqTEt1c=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
