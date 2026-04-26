{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-04-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "a339c4b13b688954aa065dd6b296da85771bb9b5";
    sha256 = "sha256-tEVwuk2iqysXcdTSlu4+gVtFMY5gpvuM71rN5tyX5fM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
