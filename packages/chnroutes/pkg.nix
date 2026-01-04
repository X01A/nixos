{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "02e4d015770f75abde532f537b2e153c549d94eb";
    sha256 = "sha256-Cc8qXgfKie1IhHkGDYaiTfiUKUpi1PhJiT5ffdvMEkg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
