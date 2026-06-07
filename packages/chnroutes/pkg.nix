{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "3d0c75167dd9d8995fa20458b5cca9cba9beaef2";
    sha256 = "sha256-p+sxr4ovHxbJi+BddBpWuAWa4Hzpw8lQ1iPMlgJcMhE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
