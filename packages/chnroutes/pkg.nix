{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-11-19";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "73ceaa92894abc9dea4f5b3f4afb8902627e43fe";
    sha256 = "sha256-AMNz32GSmFU++gSK3/Hp3IcNgrHw9mWROHCVO+dNC5M=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
