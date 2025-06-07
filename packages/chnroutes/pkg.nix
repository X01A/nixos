{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "01f6c4168be3be05dbabc964782e2d6b79b91aa8";
    sha256 = "sha256-Gbg2gxvwd35Mpw6RgcJ8tIf2zW2MJ2wb/wdVz0JoOOA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
