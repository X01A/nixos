{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "825a47e92d2fa594f2d02a57026b84b8c24329a0";
    sha256 = "sha256-JoW5NzMWUmAUwvISGLslPltcYWXk6LSZ7sqSI1p8XXo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
