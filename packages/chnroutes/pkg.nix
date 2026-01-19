{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "179cb3351b6a0a92782a00f6d9bc54c9ab8ccca0";
    sha256 = "sha256-u2PQDworYxiG3/Sy8WD/KmIoSq9nchXcgp8/zGNt5hU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
