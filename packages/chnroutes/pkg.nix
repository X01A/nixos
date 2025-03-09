{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-09";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b40aaa021a777b4374a72b82f97aacea2eba5c55";
    sha256 = "sha256-X0hGl0haNsahd94u46iyF1aWBlMQ2Ufu8wo2Kuv/+vQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
