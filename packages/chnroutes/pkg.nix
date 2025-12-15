{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-12-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "8ed33445540fc8c39335967113e427ae2029ffed";
    sha256 = "sha256-7/rML3Cfd6600++GE8NDIaUicSSZFSXrMvMJ3QC53/k=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
