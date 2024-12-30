{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-30";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4aac7ef922da11d3c6ace105acfdb69ecf63fedb";
    sha256 = "sha256-4kZZl17bzJCHx67k8ViU/ywP97FfsKGEDj6DxTFgRCA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
