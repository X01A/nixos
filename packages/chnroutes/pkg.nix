{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "08694f4ff19f457d8883f727325fa4dccac8159a";
    sha256 = "sha256-FwdwFXFYecD4eWNlArPSkLmp8ANgIMs8gso2szCLo4w=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
