{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-05";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "5187dee61e5699a6e343a0475f7b0ea0942a28f8";
    sha256 = "sha256-7kkzJZ9NBkFN1KhLJMDXFr2NL22vwTdG1UneGPe9RnU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
