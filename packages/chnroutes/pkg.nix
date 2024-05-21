{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0aa8b1ada5bbd9149f72552eabf45c54f0f8d45f";
    sha256 = "sha256-eVKqIlw3rPzlWf0HxWICwdIBlXOw1Rg5U6/4sRGggkQ=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
