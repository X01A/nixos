{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "c51e1b831b5a77198ec9813636e1d496fd704fd7";
    sha256 = "sha256-p8DIdlFuW6NxW1bxnBULNkQNxh7Vxi87S6Z0FX2AJCs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
