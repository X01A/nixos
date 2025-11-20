{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-11-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "61f4b3a8931681d8325583a820a2f463f0df89a2";
    sha256 = "sha256-41Z9yON+V5gyy1IgYRRGw2TZIXu3yTk4qo5ayY5rNN8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
