{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "b4a3dc9a57fbf5b975c68230b637e1785fadc636";
    sha256 = "sha256-L6xnxGMBTSCFxRyxf3dMWLgVsnAuOP6SMIAebfI7OpA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
