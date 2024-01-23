{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "604b18953762bea9832a34ffef1adbf09dc5175c";
    sha256 = "sha256-f/i1jR6zIz8frJ6a3OOL3Bi5pc8ZP0lnFSNTui748TM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
