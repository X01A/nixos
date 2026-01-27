{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "bd04f645223b21033192f3668c07aff760aeed51";
    sha256 = "sha256-8hEa07XoId2c6stubZBePXT3IXozlaavxUMRmsNkuGE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
