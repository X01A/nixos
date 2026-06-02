{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "409ca02531c72428a6f64db3a4b08de6e3f5d593";
    sha256 = "sha256-7cSHWHBstj1hs44Frlaa+OWaeCnuVoXBmVtzT6JBuMg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
