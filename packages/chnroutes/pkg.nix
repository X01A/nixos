{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "41d742b560e719a1353288b0fab63364cb085ac2";
    sha256 = "sha256-xPZClqhpCzEoxPHmfaqMOmQ0GkACmWDnze8T/dAnRbM=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
