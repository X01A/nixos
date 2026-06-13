{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "910399df314d67350413226e0aa4a2dac09bf4e8";
    sha256 = "sha256-pCidRc6zRdwR76v6+kScDgmdCgwFobggjlT3LG+4BnY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
