{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-06-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "7f73196bc22fe2536c4a083088534d840e167ecd";
    sha256 = "sha256-E8bMRK8C474Ou0PVwfkBqH9Iz38oCel+uN+rHOc0x4w=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
