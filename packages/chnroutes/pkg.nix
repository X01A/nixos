{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "7ae9a10208dc999adac3d6e32f23f654ff546717";
    sha256 = "sha256-BBtDeB7xi7dadOqwqLIfZ5vX4SQFXUkxhGxeuuQhEvQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
