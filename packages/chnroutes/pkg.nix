{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-06-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "5bfbd0f39188e98d42a6cce5266df4de65cbd8d8";
    sha256 = "sha256-p/z2PpQZzA7Gt4tJBgFNScQ8tHXMRsDuzP8Oqk3+s38=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
