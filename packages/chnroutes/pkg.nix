{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-11";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c36b12a3b15769364db1b1f327cf2a5a987a1a99";
    sha256 = "sha256-xzw4unAf1eK1BoycOVYzqICYMSrw5AhrXzQgM6hKd3M=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
