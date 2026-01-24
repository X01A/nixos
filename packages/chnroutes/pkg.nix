{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-01-24";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "7d5188fa0441837d875f7cb57d9bc3ad82cf967d";
    sha256 = "sha256-ntV1bhHoHOxnZE2r0C9GFgJqLKwD8I0bLTsd9vrTWaM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
