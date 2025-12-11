{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2e3b373895a80e01d53239df9e8f467a10bcb07d";
    sha256 = "sha256-vfMbBwUpDDaDErMAjo4l6OJMiHOH3cGjS0SqBe+aDXo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
