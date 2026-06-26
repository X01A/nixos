{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "b2da744cd61a7f856441e7b663cd4e513adf81c3";
    sha256 = "sha256-ostuKo9N8Z7GV18dZ0wqeFhD9cNGl/DR9Mxzn39uoFs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
