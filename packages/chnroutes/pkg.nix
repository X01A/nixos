{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-07-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "714f42343b8f85e45fbf1e3f97448ea2b9012cc8";
    sha256 = "sha256-vl6wuBUPXVpkk7uFGzMECta+pCLnVrM2aeI/6AzEcGU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
