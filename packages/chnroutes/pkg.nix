{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "183a44bf4e6f624ff353573420740e96966f7973";
    sha256 = "sha256-L2MVPilnvvqgj7KdITCWoZ5VBlk9sGBfb2jp5s40rx0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
