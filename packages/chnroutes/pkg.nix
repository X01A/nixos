{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-07";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0b7991bcb5e194730c044556df17b29eb76e138f";
    sha256 = "sha256-2ok6f+ipA3kVfYcnTAJl++RlX8lpUIL9n023FIB5/rk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
