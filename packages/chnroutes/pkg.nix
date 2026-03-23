{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "4075f489c82ceaf1a0b41559123e994094c4f554";
    sha256 = "sha256-3i9xoQADSOTJH2nvwjaI6ucGwUJbMKdhSeWuQQ0Ojj8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
