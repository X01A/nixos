{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "76700467be6b87891b1444d21bf49cca13626821";
    sha256 = "sha256-1yD5yyIOvZXYcThJFmAhBMUP75Fo/3GjQFcGEj9HG28=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
