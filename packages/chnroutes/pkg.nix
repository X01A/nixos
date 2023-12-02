{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ca7c42992d1a1fb0e5ae245616816e176b602848";
    sha256 = "sha256-CmEoptg+6E8PVBtd3V43D0D1usgpPT1yYAhFVO4N50g=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
