{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "036089a5fb7cd3993e59b896efe7a129740bcd55";
    sha256 = "sha256-9DrAYRjpezRjKOHUXV04unD6497+0FVl0/xCOJldktk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
