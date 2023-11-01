{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "unstable-2023-11-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c4d18feb7cace5c0158231d4222b20896fe74cd1";
    sha256 = "sha256-uDQI8PzUNsp1OxppdUqOAhs6ecSbA7VW5sjyqEK1AWs=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
