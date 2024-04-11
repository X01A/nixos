{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "1f849b43f11ed4f1fb33ceebdf39a0ca376843dd";
    sha256 = "sha256-OYOiIUR1c5sIPvO13+z63XZ6ZPlhj/qW5TVpFeXQbHE=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
