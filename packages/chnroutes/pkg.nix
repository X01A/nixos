{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-03";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "21c7d9f31d861392f677a399e83888ed99138050";
    sha256 = "sha256-ApkMse2zt7JpF1xqRSqhivwTto0dDLNF2N8yCCbEbOU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
