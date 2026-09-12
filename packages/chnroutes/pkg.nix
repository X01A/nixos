{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "a9278202c61c8cb922c2b51b73a1e913e602504a";
    sha256 = "sha256-5dGx1AVhaXtc9Px/EU9RrAGKd8Xac5FU+UtLL8/Mlfs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
