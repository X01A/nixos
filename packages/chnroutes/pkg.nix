{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "67120b4e3618aa1e5f446e685136d049c53cb957";
    sha256 = "sha256-tibuzfdrS/CXqe8PXZsKi4snq01Vjsy96n/EXoNvuUo=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
