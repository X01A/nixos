{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-07-04";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "11670535818b04833b25637156e9bc5563008cb2";
    sha256 = "sha256-7XjFAhW1PynHISbBubzwy0h6Fzx1l+jjXMkm8wao9E4=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
