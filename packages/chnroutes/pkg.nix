{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "ab38fb41a7a855019a5356d5e6e08935bbe7a112";
    sha256 = "sha256-rXLLEASku5f6/ifYmw5W+OEboqUeBPcIN2Xff62baU8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
