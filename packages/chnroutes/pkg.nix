{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-05-23";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "043c9d83e1bee0aea87199d8534c6d2f6dbb3649";
    sha256 = "sha256-y7r6HwxLLjnwZYKqKz6/4vO34SPvEIqi/aA4ULcuw/0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
