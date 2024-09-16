{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ab798b5e74e8f48ac8b54f976c88e14eaaef726d";
    sha256 = "sha256-vB9FDKlQzA2SCyy609HU6CRLuv3LXwHV+ExXsEwpt6U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
