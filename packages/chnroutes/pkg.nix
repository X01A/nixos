{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-10-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "8c6c119a34abfb8f98f27fe7f6159d2c8be2d25e";
    sha256 = "sha256-/byiqSgi14XEIcMbpxUJ85M+ZXitR/7NF2lCC3oaiiI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
