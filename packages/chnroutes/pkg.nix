{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "7a6eac55569727dedd2e99461f0a71fb22346548";
    sha256 = "sha256-rAEycHSKX23bRCP91By7vq2ZpFvh/rVFMAn2MLpFcQU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
