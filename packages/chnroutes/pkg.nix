{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-10-22";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "2467c8a73954b833cb4cf98a93b7c73c68a7ec99";
    sha256 = "sha256-K+WV4zK9Dg9e/YZ39czuKu8Wns0mRuUzpLz0jeeZ2Tg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
