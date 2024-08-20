{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-20";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "b6c04b043ace4aad32fc3a3b714c932dfd7fed82";
    sha256 = "sha256-204HTuw7nCNaPEfEi6pWyktU8kBNw5EXMsYAlkTeNQs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
