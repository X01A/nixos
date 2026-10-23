{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "58935df54aa06a12aefdd518b3ac347fec683904";
    sha256 = "sha256-KCYpr2iS1TrYeNYr3kym4De7I92lOPBry6Ngy6W5qRU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
