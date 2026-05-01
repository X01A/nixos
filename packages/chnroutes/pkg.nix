{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-05-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "6da7e1cd41cb65cbc2ad3d442b9a931d5c55c606";
    sha256 = "sha256-vpuLziKOOEX4kFmkEY578Rxkbklm0tIFp6xxd3VW8iY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
