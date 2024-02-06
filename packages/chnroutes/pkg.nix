{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-02-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9b157c75586e15d8f2859c64f13d05cd3b38243e";
    sha256 = "sha256-QZTjghChOHeJ6VycWkze+UHP02X4aSlyn2pmobLFG08=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
