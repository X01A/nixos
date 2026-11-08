{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-08";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "10f56a0822692a0f8b3f0d13de81e7585008ba8e";
    sha256 = "sha256-E2pJ8UnbgcaTCEovIwps18QF50eGAMLSSxv+pfAiqVU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
