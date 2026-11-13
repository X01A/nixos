{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "6d436f6fe7a555767e82cd16544f341397deda9f";
    sha256 = "sha256-hi45uaukt1AUG9Uri2dFd0ozECCqN1iMqvH8IBiTK4g=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
