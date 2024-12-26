{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b4e44fbf34a8a33e1a8f9074f2c9e5e23a4da555";
    sha256 = "sha256-WsGDqhSQsnOEMICbXXny4fSE9/RdFjXIHiJzE7dfNx8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
