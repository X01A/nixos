{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "9d3e3bb2e69f47e46d2295f98eeb168e8caed87f";
    sha256 = "sha256-f2fWe0X8aUoEjOGUGsplgoYknyPOe/cBG86AtgXS/zU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
