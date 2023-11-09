{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c48d5365ceaef0e0b653de26c15ee3ecfe32e4c4";
    sha256 = "sha256-kSd9tmI8De4EUp0ORJcLm0Cf0QkjO0jZ0GNPhwyPvso=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
