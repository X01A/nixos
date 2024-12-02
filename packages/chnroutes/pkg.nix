{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f5bed00f134cfb1bd2e01212165f6b68d3d73ef3";
    sha256 = "sha256-fDKEK1p4FV+/9O26p2OjkDwY6zaskzeiCPfSzZQ9yLM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
