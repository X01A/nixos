{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "9f2c3db90718a6d32805cbd4f936be5c738fa4fe";
    sha256 = "sha256-zEuHVbF339txUzWgFNdmyzNlSuMe3nTf+IuvNXHYwtc=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
