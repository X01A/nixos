{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "b4f67894d91be48ae8aeeee72279ce8e62ee17d9";
    sha256 = "sha256-udMJdh54DOKzl7RauUljPS5vmjdc8n6JxXxGjDiayDY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
