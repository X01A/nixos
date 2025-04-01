{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-04-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "9d6d40309fbb8404b7309dc77ba047fd6cb471e9";
    sha256 = "sha256-LyDF4h2wJDj8HkhapeSHg1arNi7VwF7mRRklHp3XjzU=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
