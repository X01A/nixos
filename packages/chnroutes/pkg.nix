{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "49a58c619ed15754b826929532897576ffef5aac";
    sha256 = "sha256-bQN1nHup2kUqLDb9ywN2t8U0dkREEepBeTeO5JvPLLA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
