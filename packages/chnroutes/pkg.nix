{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "cf6c0602beb35f51841d5956d8232d19acbe3a3a";
    sha256 = "sha256-4jPoW3jD2evhvXMxXbIsObsVMDjMolEisUk5eie3Z8I=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
