{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-12-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9c9c653b875248fd1a9c6fcaffe8ba47b35b490c";
    sha256 = "sha256-FZfJ0KIKjTFZuUxXgKtqg8sTgAO8/7ciAH+PzEqT7T8=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
