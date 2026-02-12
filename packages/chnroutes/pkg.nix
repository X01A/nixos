{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  ...
}:

stdenvNoCC.mkDerivation rec {
  pname = "chnroutes2";
  version = "0-unstable-2026-02-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = pname;
    rev = "fe21ab8aef3339e6481f59c97a7e62d0e1c0cee4";
    sha256 = "sha256-bKHDERO2BAIpVUGc6v5NPCEejPEwmNQJCMaIT/TpU7c=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
