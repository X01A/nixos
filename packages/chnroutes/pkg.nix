{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2024-01-21";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "5b4543c400c20421787f42208490776dcf309809";
    sha256 = "sha256-IntAtTpSa2mmJHnTcHJd6r9p1iWEyqbWNI3OZpf9O0U=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
