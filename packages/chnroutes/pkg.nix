{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "d90dca97ac3d7fe82301e075b36e0023a9745fd2";
    sha256 = "sha256-o4cZbHerN+08ZpeCAYP/MT7eX7cCDKZ4ooBv7ykcCgM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
