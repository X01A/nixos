{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-01-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e883827c3f80f416f6af3c8b336989649440078c";
    sha256 = "sha256-jVLGaNQQhUYHTSYLcV9KpoH4bc/0aOHzt8BoBD3MirU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
