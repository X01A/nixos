{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "2e22f85e398977e5928575bf2140bf77f2818fa9";
    sha256 = "sha256-pbZ4DmI2/dAbkIbUO+14LzbVDE4uP6MZp3xOVlIEb8c=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
