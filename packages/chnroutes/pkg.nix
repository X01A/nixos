{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "87d3cc761722e5d07dda6faa86db5361d4a62287";
    sha256 = "sha256-UEiqh2Lp97+wc1IgYohT3ovFpQs7MDVCjYjDuZ6npdY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
