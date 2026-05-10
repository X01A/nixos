{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "e13d6015f0424b60c72ef453af111a6a42884cf8";
    sha256 = "sha256-2TuO1ieGkIwSytZN5tMVrvGjD3eq+0t4KxDomnJ/xMk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
