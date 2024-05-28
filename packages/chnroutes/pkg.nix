{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "edb271b952abb155e93c91a60dfacdc74bfd3555";
    sha256 = "sha256-hxZPrVYo68i5FhDw/GYMpnXoChU0w2jLk1VuiPmUAYU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
