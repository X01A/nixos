{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "af2b3e1939ccb238c53f96d577188b8b1944d7be";
    sha256 = "sha256-pCxRN1RMm4C9Bau2cAkn9W9uYIY4mpcf+8DFP10uxUE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
