{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0a9942a47e3dba3fe00f69aea6b1a2d872882d24";
    sha256 = "sha256-T6A4s5zzt010+PfGopVCbbFfaxXPQK8MDvaSE+eeU3I=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
