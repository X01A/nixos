{ lib, stdenvNoCC, fetchFromGitHub, ... }:

stdenvNoCC.mkDerivation rec {
  name = "chnroutes2";
  version = "0-unstable-2025-03-31";

  src = fetchFromGitHub ({
    owner = "misakaio";
    repo = name;
    rev = "0edb18dd79518ec00c5dda998d27bba0d4d5ec2e";
    sha256 = "sha256-3BUhuE8oBhzuCzpUW3uGP8MhLS3dcvHCn5Dydz5/SdI=";
  });

  phases = [ "installPhase" ];

  installPhase = ''
    cat $src/chnroutes.txt | grep -v "^#" > $out
  '';
}
