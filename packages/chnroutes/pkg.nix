{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7513cf0b467682c9fa47bd8bce306ba0f216901c";
    sha256 = "sha256-jk7vcnEM1zyep6D+dAVNkjze7eVfRBd3jx7pkZ9ZI38=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
