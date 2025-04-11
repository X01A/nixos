{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0037209c1c0a61d882bef9e058f838ba126039c4";
    sha256 = "sha256-OGB1YDhM1MISxtz3CaYufjpJ1JlUuzNGR+YzlV6TCrw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
