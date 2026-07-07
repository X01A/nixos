{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "afa282441822b2a41d9691647f44522915013298";
    sha256 = "sha256-pSCMito7bSjLbkLvadi1E5DK/LIxqDbK2ZM/1xTK02k=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
