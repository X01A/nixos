{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "2e711fa22fae84faaf7c0815f3c15d7b4810bfe1";
    sha256 = "sha256-P1C2ve15VaZjB1AFSHR3ebYoyepmOCvzbvUNMwIAyY4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
