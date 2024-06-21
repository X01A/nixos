{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a32dd5a5e04d3cc78b5cb8627b3ac95b3c207b80";
    sha256 = "sha256-qDA41x7pcV7L+by7foJEVUErc5U7LP0QrWR3mva6hrI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
