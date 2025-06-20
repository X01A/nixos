{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "eee0e52e2c06746a6d2d770b380dc3d95b6cd4f7";
    sha256 = "sha256-mYcOfb2HqrVRLfapX/dKph5Z5f8shsjaJtKNLLdIvKA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
