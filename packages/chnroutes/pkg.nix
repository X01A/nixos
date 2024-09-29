{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-29";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2d5c591d70cc41e3f3cd8f1fee99cbc9722e83d9";
    sha256 = "sha256-SSF3L17Wkdyjgm9Uzz3/8yakKisk3U/Pegz6B2/qomU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
