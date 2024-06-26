{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-06-26";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "6e376eaa4b15a39a227a9010a33f9842f272f3e1";
    sha256 = "sha256-8zZwIob1VZXwQpN7of1WoycvLoh+sk7Q+C7Ciz0FlDk=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
