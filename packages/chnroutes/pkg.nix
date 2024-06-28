{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-28";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "de66f5ccc87f277ac1ef1f363ec690471cc7ffd6";
    sha256 = "sha256-VP9fYh6Cvmh5URCZ8STuLzX7M58i7xX08kHujzfolko=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
