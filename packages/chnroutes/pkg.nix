{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-09-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "4cac189354202877acdf93d8d92043e7cd3a4fee";
    sha256 = "sha256-lwpENSbXfl6kd8tTeL/abKENQ07VjNqNQzBi2T9DP9U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
