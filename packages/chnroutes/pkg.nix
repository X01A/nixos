{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "fea84fc352a2e51d277e1cdfcb08ad340ae8b021";
    sha256 = "sha256-1tbpqZbZf5j16pD3UKJWm+I98oZtCddHR1pb7G4dtNI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
