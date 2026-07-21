{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "fa2ad102788aa8fa81f254814826f74f42889c22";
    sha256 = "sha256-u/gqe+ptgUanqO2itX8hx999GzxeBjwx+dviuCFCyZI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
