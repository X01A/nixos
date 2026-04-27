{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "b5d09968c50867ea37ea02a2f7be86b47d178e86";
    sha256 = "sha256-rTlBoknVbFsa4S7GYD39TO9SLJuJVeH1M/RSQNshLxU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
