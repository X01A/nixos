{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-04-15";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "59b9cf3aa8759a27d6f2a78d4e956273d5091f28";
    sha256 = "sha256-Ew6YG5qmCCuHlysFCl+abL2mM08xcfrs8MDpQlb9Pok=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
