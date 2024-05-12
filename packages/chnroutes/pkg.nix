{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-05-12";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "44ee75c42931ad5f7e7bb809f43b83ca64fa0ce7";
    sha256 = "sha256-S+XvlEtu8th2/phMPhMSDMLfEIdNEostpcX4PBpPAI0=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
