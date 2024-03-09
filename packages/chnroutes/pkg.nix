{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-03-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3779811353fe31ce345c3d96866b39f3b7ce5544";
    sha256 = "sha256-wE4UiJ3Oh+/wz/NT3OSSzcbL5b6kd4dMRP+BNf+P1hs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
