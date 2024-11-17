{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-11-17";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "6a4306c5aa1297ebe6fce3368aa127901a225058";
    sha256 = "sha256-47QndFyQ8PCHJdfkxV8LBGqMVNGykkc+Sy44s2Kiw28=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
