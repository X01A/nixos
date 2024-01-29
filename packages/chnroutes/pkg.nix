{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "30d0540a3f2fa606ee4dae50ebe3a03259206b98";
    sha256 = "sha256-EegXMeUvFPmLUd2Ec7W/OOOsDihu6vumlyYRqWpyVL8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
