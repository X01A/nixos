{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "10d43fbbb21257432d9fbff57c6191c740993fbc";
    sha256 = "sha256-jS2ckVK3x4a8tyAoK+GQYDEs5UTlNr2/BIdXzGzt+wA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
