{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "e80ac66cd0ffc0cd14e3c9fda020a1d7ad2a1b89";
    sha256 = "sha256-y5eFnblPdrcDOJgTNRLb7AtHJ9mkAp9Oimjt8GMM2eI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
