{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-13";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c5555921bc0b4c1c7b248b611300cb09db486e2f";
    sha256 = "sha256-WGoehE3cEX79LdA6lrX0I/Yhb8dkxYE2kEotmAc0iH0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
