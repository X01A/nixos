{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "ec095eadb8b2774e845833464b6ee667ef90166a";
    sha256 = "sha256-5xcTCOCXrUN0doX7nTPriQ48M3b3JLDNYmEX3DIq7as=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
