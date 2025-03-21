{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "588e2f1493f6431a58bc57df5d2d592d248db4cf";
    sha256 = "sha256-ORNxwccgQVJo6hnRLsLatmNmuiTn/hM3gDmLQkdjmRE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
