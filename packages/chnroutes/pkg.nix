{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "33a9cbda4c5d298b3727cd4ec7c7d7e33e2eb5a2";
    sha256 = "sha256-ZzKdwX9v3pTF8Ohq+V2XfinDNHvfzG4UDh0Y8a9cfHo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
