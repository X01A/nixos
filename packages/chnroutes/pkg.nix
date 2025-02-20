{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-02-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e453908193acd9be86863979dfcb3a53bb8495a4";
    sha256 = "sha256-ZHJYvtthAN5VckMg6bsLSnSCDrgJ5jRdRZWjRcLvtAk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
