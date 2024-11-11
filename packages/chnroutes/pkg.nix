{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "ae1083959e48b2f752a7838355fdfa74dbe653e8";
    sha256 = "sha256-WHFfVD44fW3DK/lIQnWK8UrifSJYfVbrFwltO6OVNck=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
