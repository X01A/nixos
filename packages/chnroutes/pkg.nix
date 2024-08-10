{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-10";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "a39a841630c34a42ca28abdfa212960eb68e7455";
    sha256 = "sha256-vqy3S1MLWolzrek7Z0NAWmDugBFGDIOyy/ctCLKBc4g=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
