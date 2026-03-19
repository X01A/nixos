{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-03-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "636e99f4a1923ee58b6828d845bea9be50351ac5";
    sha256 = "sha256-mUuQMc4Lw2UeQp6+hMNCA80S1LkQzlHGb90VCOW7Q3U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
