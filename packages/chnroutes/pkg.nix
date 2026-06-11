{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "6ee8b06cb97da22ec5f933ca91bf0613ae7f7dd2";
    sha256 = "sha256-idD8T/4Y9+2Fk2gJdsxHLuDoSB1rt2r+6rapFyiwFps=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
