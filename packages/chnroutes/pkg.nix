{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "b31e89f54ab4cf4c3a6638a0995cb334a61af0e3";
    sha256 = "sha256-QCneAvUXWeLiI0ttF3yoeMYHT07qtWOuWw5b/mSI44o=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
