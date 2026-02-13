{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "c70e6a3bbeb5b66a32f823ca6399db0f7123bc2d";
    sha256 = "sha256-bKNiCupL3Ay9RDAKTduVZzCu1Xi17jF6HOWVzUX/jJs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
