{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "475a5e3cde18f81e2838577e7bf0bed0850459a5";
    sha256 = "sha256-XK2SxRLgzEijt5GbnuTVaN8tlZSvjcTD/LYffc3xyFY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
