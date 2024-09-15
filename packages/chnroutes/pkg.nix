{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a80e69a7ba2f71d79749c0b055aef07faf283745";
    sha256 = "sha256-v0ZcPOwAD0Hl71XO9GOki5zBpupOGldaEEzMhkkfQyw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
