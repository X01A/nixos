{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9cb5304764b7b2c3193488b2e66c27a976fa4c09";
    sha256 = "sha256-JSf9jEkJMBAp5+2pMNA1sxGxcb0gg5hsjXyi4b3FacE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
