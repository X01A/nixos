{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2024-08-06";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "4ed7054adc57371fd2555ff21c031bd022dc7372";
    sha256 = "sha256-wkBmLzB7LF1y51zN4mG2CJerk7yIPqhmacCcM3tcUDg=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
