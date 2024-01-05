{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "934a2941a63b260634903227f7505c4f534026ad";
    sha256 = "sha256-utoVGIS817E10vyH4K7wVeYPP4XwJW7as0GiTTTKA9A=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
