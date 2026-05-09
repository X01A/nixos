{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "a23662fb93e883a4a8dfba74668a73987fc77e9b";
    sha256 = "sha256-6PXmVmERZd56MHlSbxL7RoAeGwvuD+SwrZ+O1o0+o70=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
