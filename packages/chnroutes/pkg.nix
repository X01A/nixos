{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "cfe2ec3249e2c9841b20994403fffc3101d3936c";
    sha256 = "sha256-jkHbob8tBrg+jEmCftL/n2jFr8axISPu6Zd0e9HrlXs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
