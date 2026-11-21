{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "cd1f0309dd34a67e55f88c87b288c3e78a1a1826";
    sha256 = "sha256-QToFphqxP89FNo988l719yZsDhj1o54MPHwwvWDXq5o=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
