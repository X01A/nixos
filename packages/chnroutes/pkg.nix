{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "4fd5035b57b87bda23e3446b96c438346a10acb4";
    sha256 = "sha256-KmldRRTzeMqro0azffTTCmLCsxqk2VmTEcTW+x4/PvE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
