{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "7c060ed2d68d219e27e35f281d5c4aedb971fe27";
    sha256 = "sha256-Vbaj1WURLA3MRslyEgRth9xNzGdE39SnoPU1oDUV/VE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
