{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "496f04125ed2e314fde4f479a3d6b824d92f23b5";
    sha256 = "sha256-prvCgZ1rII9xPREGNU+j5ZUGFytBkD5vjOw4omP1GAA=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
