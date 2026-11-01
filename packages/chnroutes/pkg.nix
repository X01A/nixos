{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "6e13d6af9d81cdda9b5ce1ea9ba91ede58d80ed6";
    sha256 = "sha256-dbT8/QEDhfnJPZmUXXtwDJ2AX3baDzSOX9k1vmWZk20=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
