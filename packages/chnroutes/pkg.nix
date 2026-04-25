{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "b286bd31253bba47c6d4630c2660a65bfe168148";
    sha256 = "sha256-24vJ566icxuCxAW1gjP0AUphsk3KBRkLbB3pALw0zgs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
