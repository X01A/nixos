{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "0cb542f40655d8b857002c1766ea9af49a55c99f";
    sha256 = "sha256-xZkL8MOLURsxOZzz65HovPxGp743fQ/jT3vI7e2JV5c=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
