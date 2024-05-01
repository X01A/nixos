{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-01";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "c1ec6244aee2609028626626abc234130d949eb5";
    sha256 = "sha256-EQ9HaiAFzNoF1chLH+d8o472RpHOXs9mS1IQgOhvF5s=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
