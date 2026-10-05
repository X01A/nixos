{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "d2ce6d549dc742315eeaead5ce654ae06adacbd5";
    sha256 = "sha256-6pZNZ4xhiSZrPUO238xar+OuTA5okOydsFL7eUR3B6k=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
