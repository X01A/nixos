{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "e11ab37afdd595f08a115c719a98148b33f4bd79";
    sha256 = "sha256-vQIw+w/dkyZRa8cHsW3MB05zS/8cIXnO+AiUK2XK6aM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
