{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-14";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "e6ff3acec1ba2e203483d6425101a66636d56f22";
    sha256 = "sha256-5m6Wiyv9l2f3F+pKO43LMOB1133IUoq4jVn5Qg4ebBs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
