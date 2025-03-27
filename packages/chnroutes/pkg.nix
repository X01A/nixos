{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "6d6cd7f2c7cbec9e3bfe32cee60150e7e6fd6615";
    sha256 = "sha256-qjEGXW27Zc3XcqAjmiZUndhI/gE3YS+iLxyenA3hcsk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
