{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "2270d5a964011f63a3b72ca83513c4a8545d1e2e";
    sha256 = "sha256-adAek0uC2L+rCEdQ//K8l1pKswm51P5dP+PhnS8V9VU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
