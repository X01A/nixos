{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-09-25";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "50ba991d4a46aa9d309a876c155025bf03b8d49a";
    sha256 = "sha256-NLHo0fsrhL/HAs/gXyEGCc1NErCxdAFa9ZJ1iaxT3zg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
