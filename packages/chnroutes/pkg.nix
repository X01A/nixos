{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "a5907ed38407359c8a53e1f95eec5bcfbd59e3e0";
    sha256 = "sha256-AzmroC2Wzkc7ATgj2oaM9swX0Q1oWI/Q1rY8aVu3Bpk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
