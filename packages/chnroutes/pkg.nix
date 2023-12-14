{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-12-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "3651a600d4f1a894d59781557402f11dd131d218";
    sha256 = "sha256-AxjXa9Que9F1MkakiyjQF6U4glWNvoSTXb/T/y4ZnBw=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
