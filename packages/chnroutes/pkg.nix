{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2456f44612e1e91c7bc75601d2808a64f379a514";
    sha256 = "sha256-342giZ3v+xGUr3eDMlB/IOYDPXKYQtbXzPTxQ8xYDm4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
