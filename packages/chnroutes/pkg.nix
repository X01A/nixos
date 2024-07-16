{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-16";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4028ac6d3de17800fafcc39671d101f6556f2be4";
    sha256 = "sha256-GdhDwKzOGCH8C4Hc0Y8m0U8y8f4OMM7UYDJwVGga7m8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
