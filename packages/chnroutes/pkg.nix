{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-08-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "4e126126e18487f5d2fef33edfeaf1accd0b540a";
    sha256 = "sha256-4V4tDuGNuWAq6jNKLM4clFH4/KSC+YBimpCElEKJASE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
