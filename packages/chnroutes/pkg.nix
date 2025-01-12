{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c8ec7835509e9feb0b5526d25f86235ba99a78e4";
    sha256 = "sha256-6dhkKfL8EzKKwMAi0pFEjsiWy1mstEIqz5G3+t7O3uY=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
