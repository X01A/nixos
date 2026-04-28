{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "6d3403a31a683eb79ab6ed9f39dd46a562ce98d5";
    sha256 = "sha256-kZDj9arFh9RCRA+HPV0OdYAH27Z5CcCfXjRTCt+rQpY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
