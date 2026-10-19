{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "e30052757c52310d994eda56013ef54b35a467bf";
    sha256 = "sha256-3jDswDLodSHoWA9JDcWwSxoLGrXw6spcheFuRohATEM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
