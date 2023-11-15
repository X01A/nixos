{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "fbc7acc707e9c193b6e43418422d1550d07c9ac5";
    sha256 = "sha256-RPX7dXr+abYG/mUtz0y+N5qocEvb912RyU5bBayXQ7I=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
