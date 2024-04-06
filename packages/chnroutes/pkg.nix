{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "af37397ecfbf226a5b453a85542dca0143c7f431";
    sha256 = "sha256-1+ay0b6aZckla7BzjY53kfIl728cbaK0RpxZ4R3F2l4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
