{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-02";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "f4a9c1853306c9a1943bc7d9f925d70f3c39a77a";
    sha256 = "sha256-3blLozH6Piz1LxcD/heDmjhgsEDItKMU8daciqgLw38=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
