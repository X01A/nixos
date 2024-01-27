{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-27";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "6a92da92d0cfdc07f4bf4de0a63a95d5a0fdbbe9";
    sha256 = "sha256-c3R1RmWnsvH64fCNKyTEgiNkVUY+MqnCh1nIKTFZOoU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
