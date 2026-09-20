{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "233b69c4d264150506a4e6d55b76591dc1d5ca64";
    sha256 = "sha256-Dtw7FIcUB99CsRiqfLGyZFNueYN8ykQjdhiLpvX9O8I=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
