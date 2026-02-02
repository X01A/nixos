{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "84652092b25967586239022983362ec61f2d653f";
    sha256 = "sha256-suxFwk/y7grS8dXp46xNzv2ZPJek+KXV5+58hYfdn1Y=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
