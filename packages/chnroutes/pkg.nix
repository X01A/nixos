{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-07-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e64b80b08841dbe24fe02066f4a9bd6d5e20aa37";
    sha256 = "sha256-iY70zCraYVp7niQRlGM63j26QPLIaWiwVCgjKNZUFnA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
